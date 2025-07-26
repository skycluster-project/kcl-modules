# kcl-modules

Use `up` cli command to fetch the modules.

```bash
up project init dummy


# Add dependencies, examples:
up dependency add xpkg.upbound.io/upbound/provider-aws-ec2:v1
up dependency add xpkg.upbound.io/upbound/provider-aws-sqs:v1
up dependency add xpkg.upbound.io/upbound/provider-aws-cloudwatch:v1

# Find dependencies located in .up folder.
```

To update the local libraries with the latest commit, try to replace all
instances of old commit with the new one:

```bash
# 's/oldCommit/newCommit/g' {} +
find ./ -type f -exec sed -i 's/802b17c/1b426db/g' {} +
```