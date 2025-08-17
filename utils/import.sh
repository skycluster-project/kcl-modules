#!/bin/bash

# Usage: ./script.sh <version>
# Example: ./script.sh v1

# Directory containing the yaml files (change as needed)
INPUT_DIR="./"

# Loop over all yaml files in the directory
for yaml_file in "$INPUT_DIR"/*.yaml; do
  # Skip if no files found
  [ -e "$yaml_file" ] || continue
  # Run kcl import
  kcl import -m crd -s -f "$yaml_file" 
done


BASE="models/v1alpha1"

for k_file in "$BASE"/*.k; do

  newname=$(echo "$k_file" | sed -E 's/^.*_v1alpha1_//')
  mv "$k_file" "$BASE/$newname"

done

BASE="models/v1beta1"

for k_file in "$BASE"/*.k; do

  newname=$(echo "$k_file" | sed -E 's/^.*_v1beta1_//')
  mv "$k_file" "$BASE/$newname"

done
