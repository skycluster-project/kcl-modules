
# Helper functions
_build_default_labels: (any, str, str, str, str) -> {str: str} = lambda labels, p, r, z, n {
  _l = [
    "skycluster.io/provider-platform",
    "skycluster.io/provider-region",
    "skycluster.io/provider-zone",
    "skycluster.io/provider-name",
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
        "skycluster.io/provider-platform",
        "skycluster.io/provider-region",
        "skycluster.io/provider-zone",
        "skycluster.io/managed-by",
    ]
    {k = v for k, v in labels if k.lower() in ll}
}

_ready = lambda o: any -> bool {
    _status = o?.Resource?.status
    _objstatus = _status?.conditions or []
    len(_objstatus) > 0 and all c in _objstatus {c.status == "True"} and _status
}