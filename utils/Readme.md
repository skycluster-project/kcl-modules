# Generate KCL

The following example shows how to generate KCL modules for `provider-openstack` github repository.

```bash
git clone https://github.com/crossplane-contrib/provider-openstack.git

# then generates manifests
# make sure goimports binary is available
make generate

# cd package/crds
# then adjust the import.sh as needed and run the script.
# the output is placed in a folder named kcl
```