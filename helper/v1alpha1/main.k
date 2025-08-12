import yaml

# Helper functions
_build_default_labels: (any, str, str, str, str) -> {str: str} = lambda labels, p, r, z, n {
  _l = [
    "skycluster.io/provider-platform",
    "skycluster.io/provider-region",
    "skycluster.io/provider-zone",
    "skycluster.io/application-id",
  ]
  _v = [p, r, z, n,]
  _a ={_l[i] = _v[i] for i, j in _v if j and j != ""}
  (labels if labels else {}) | {
    "skycluster.io/managed-by" = "skycluster",
  } | _a
}

# Default labels for SkyCluster resources
# Input: provider platform, region, zone, name
# Output: labels dictionary
_set_default_labels: (str, str, str, str) -> {str: str} = lambda p, r, z, n {
    _build_default_labels({}, p, r, z, n)
}

# Set composition resource name
_set_resource_name: (str) -> {str: str} = lambda name: str {
    { "krm.kcl.dev/composition-resource-name" = name } 
}

_is_paused_label: ({:}) -> {:} = lambda labels: {:} -> {:} {
    { "crossplane.io/paused" = "true" } if labels is not Undefined and "skycluster.io/pause" in labels else {}
}

# Filter SkyCluster labels from a dictionary
_filter_sky_labels: ({:}) -> {:} = lambda labels: {:} -> {:} {
    {k = v for k, v in labels if "skycluster.io" in k.lower()}
}

# Filter default labels from a dictionary
# A provider is identified by its platform, region, zone uniquely
_filter_default_labels: ({:}) -> {:} = lambda labels: {:} -> {:} {
    ll = [
        "skycluster.io/application-id",
        "skycluster.io/provider-platform",
        "skycluster.io/provider-region",
        "skycluster.io/provider-zone",
        "skycluster.io/managed-by",
    ]
    {k = v for k, v in labels if k.lower() in ll}
}

# Filter labels based on a list of fields
_filter_labels: ({str:str},[str]) -> {:} = lambda labels: {:}, fields -> {:} {
    {k = v for k, v in labels if any_true([f.lower() in k.lower() for f in fields])}
}

_ready = lambda o: any -> bool {
    _status = o?.Resource?.status
    _objstatus = _status?.conditions or []
    o and _status and len(_objstatus) > 0 and all_true([c.status == "True" for c in _objstatus])
}

_append_init_scripts: (any) -> str = lambda _yamlScripts {   
    _writeFiles = [vv for y in _yamlScripts for k, v in y if k == "write_files" for vv in v]
    
    _runCmds = [vv for y in _yamlScripts for k, v in y if k == "runcmd" for vv in v]

    _yamlOut = yaml.encode({
        "write_files": _writeFiles,
        "runcmd": _runCmds,
    })
    
"""\
#cloud-config
{}
""".format(_yamlOut)
}

_select_init_scripts: (any, [str]) -> str = lambda _scripts, names {
    _selected = [s.data?["cloud-init"] for s in _scripts for n in names if s and n.lower() == s.metadata?.labels["skycluster.io/script-init"]]
    _yamls = [yaml.decode(s) for s in _selected if s]
    _append_init_scripts(_yamls) if len(_selected) > 0 else Undefined
}

# Retrieve the instance type from the providerSettings object
_get_instance_type: (any, str, str) -> [str] = lambda _provSettings, _itLabel, _zone {
    _itypesYaml = yaml.decode(_provSettings?.data?["flavors.yaml"]) \
        if _provSettings?.data?["flavors.yaml"] else Undefined

    # we expect one member: (flavors (list), zoneName)
    _itypesZone = [fz.flavors for fz in _itypesYaml if fz.zone == _zone]
    _itypes = [{
        ram = fl.ram
        cpu = fl.cpu
        name = fl.name
        nameLabel = fl.nameLabel
        generation = fl.generation
        price = fl.price
    } for fl in _itypesZone[0]]

    # There can be multiple instance types with the same label (i.e. 2vCPU-4GB)
    # We return all of them that match the label
    [d.name for d in _itypes if d.nameLabel == _itLabel]
}

_get_image: (any, str, str) -> any = lambda _provSettings, _imageLabel, _zone {
    _images = yaml.decode(_provSettings?.data?["images.yaml"]) \
       if _provSettings?.data?["images.yaml"] else Undefined

    # If there are multiple images with same label (i.e. ubuntu-24.04), we ignore them
    # and return the first one that matches the zone and label
    [{
        name = z.name
        nameLabel = z.nameLabel
        generation = z.generation or Undefined
    } for z in _images if _images and z.zone == _zone and z.nameLabel == _imageLabel]?[0]
}

# Calculate a new CIDR subnet based on an existing CIDR and additional bits
# Temporary function for net.CIDR_subnet to be released in KCL
_net_CIDR_subnet = lambda cidr, additional_bits, num_bits {
  ip_str = cidr.split("/")[0]
  base_len = int(cidr.split("/")[1])

  # Calculate new prefix length
  len = base_len + additional_bits

  # Convert base IP to integer
  parts = [int(p) for p in ip_str.split(".")]
  base_ip = parts[0] << 24 | parts[1] << 16 | parts[2] << 8 | parts[3]

  # Add subnet offset and mask to network address
  new_ip_num = (base_ip + (num_bits << (32 - len))) & (~((1 << (32 - len)) - 1) & 0xFFFFFFFF)

  # Convert back to dotted string
  a = (new_ip_num >> 24) & 0xFF
  b = (new_ip_num >> 16) & 0xFF
  c = (new_ip_num >> 8) & 0xFF
  d = new_ip_num & 0xFF

  # Final CIDR string
  "{}.{}.{}.{}/{}".format(a, b, c, d, len)
}