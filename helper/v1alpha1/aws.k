import yaml

# Retrieve the instance type from the providerSettings object
_get_instance_type_aws: (any, str, str) -> [any] = lambda _provSettings, _itLabel, _zone {
    _itypesYaml = yaml.decode(_provSettings?.data?["instance-types.yaml"]) \
        if _provSettings?.data?["instance-types.yaml"] else Undefined

    # we expect one member: (flavors (list), zoneName)
    _itypesZone = [fz.flavors for fz in _itypesYaml if fz.zone == _zone]
    _itypes = [{
        ram = fl.ram
        cpu = fl.cpu
        name = fl.name
        nameLabel = fl.nameLabel
    } for fl in _itypesZone[0]]

    # There can be multiple instance types with the same label (i.e. 2vCPU-4GB)
    # We return all of them that match the label
    [d.name for d in _itypes if d.nameLabel == _itLabel]
}

_get_image_aws: (any, str, str) -> str = lambda _provSettings, _imageLabel, _zone {
    _images = yaml.decode(_provSettings?.data?["images.yaml"]) \
       if _provSettings?.data?["images.yaml"] else Undefined

    # If there are multiple images with same label (i.e. ubuntu-24.04), we ignore them
    # and return the first one that matches the zone and label
    [z.name for z in _images?.zones if _images and z.zone == _zone and z.nameLabel == _imageLabel]?[0]
}