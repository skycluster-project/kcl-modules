#!/bin/bash

# Directory containing the yaml files (change as needed)
INPUT_DIR="./"

# Parent output directory
OUTPUT_PARENT="./kcl"

# Loop over all yaml files in the directory
for yaml_file in "$INPUT_DIR"/*.yaml; do
  # Skip if no files found
  [ -e "$yaml_file" ] || continue

  # Extract the base filename (without path and extension)
  filename=$(basename "$yaml_file" .yaml)

  # The filename has the format: group.domain.something_resource.yaml
  # We split at the first underscore: left = apiGroup, right = resource
  api_group="${filename%%_*}"   # before first underscore
  resource="${filename#*_}"     # after first underscore

  # Get only the first part of api_group (before first '.')
  api_dir="${api_group%%.*}"

  # Output file is named after the resource
  output_file="${resource}.k"

  # Full output directory inside parent "kcl"
  full_output_dir="$OUTPUT_PARENT/$api_dir"

  # Create output directory
  mkdir -p "$full_output_dir"

  # Run kcl import
  kcl import -f "$yaml_file" -o "$full_output_dir/$output_file"
done

