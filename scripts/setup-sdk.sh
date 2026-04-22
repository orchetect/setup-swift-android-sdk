#!/bin/bash

# setup-sdk.sh
# setup-swift-android-sdk • https://github.com/orchetect/setup-swift-android-sdk
# © 2026 Steffan Andrews • Licensed under MIT Licens

# Inputs used:
# - SDK_ID           SDK ID
# - TARGET_TRIPLE    Target triple

# Step outputs produced:
# (none)

# Get SDK path.
SDK_INFO=$(swift sdk configure --show-configuration "${SDK_ID}" "${TARGET_TRIPLE}")
SDK_PATH_REGEX="m/sdkRootPath\:\s(\S*\/swift\-android)/g"
SDK_PATH=$(echo "${SDK_INFO}" | perl -nle 'if ('$SDK_PATH_REGEX') { ($path) = ($1); print "${path}"; }')
if [ -z $SDK_PATH ]; then echo "⛔️ Error: SDK Path not found."; exit 1; fi

# Output diagnostic info.
echo Android Swift SDK Path: "$SDK_PATH"

# Run SDK setup script.
cd "$SDK_PATH"
./scripts/setup-android-sdk.sh
