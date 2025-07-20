
# Helper functions
_build_sky_labels: (any, str, str, str) -> {str: str} = lambda labels, n, r, z {
  (labels if labels else {}) | {
    "skycluster.io/managed-by" = "skycluster",
    "skycluster.io/provider-name" = n,
    "skycluster.io/provider-region" = r,
    "skycluster.io/provider-zone" = z,
  }
}

# Default labels for SkyCluster resources
# Input: provider name, region, zone
# Output: labels dictionary
_default_sky_labels: (str, str, str) -> {str: str} = lambda n, r, z {
  _build_sky_labels({}, n, r, z)
}

# Set composition resource name
_set_resource_name: (str) -> {str: str} = lambda name: str {
  {"krm.kcl.dev/composition-resource-name" = name} 
}

# Set paused label based on existing labels
_is_paused_label: ({:}) -> {:} = lambda labels: {:} -> {:} {
  {"crossplane.io/paused" = "true" if labels is not Undefined and "skycluster.io/pause" in labels else "false"}
}

# Filter SkyCluster labels from a dictionary
_filter_sky_labels: ({:}) -> {:} = lambda labels: {:} -> {:} {
  {k = v for k, v in labels if "skycluster.io" in k.lower()}
}