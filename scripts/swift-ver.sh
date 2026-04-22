#!/bin/sh

# swift-ver.sh
# setup-swift-android-sdk • https://github.com/orchetect/setup-swift-android-sdk
# © 2026 Steffan Andrews • Licensed under MIT Licens

# Inputs used:
# (none)

# Step outputs produced:
# - swift-version

# Get Swift version
SWIFT_VERSION_COMMAND_OUTPUT=$(swift --version)
SWIFT_VERSION_REGEX="m/.*Swift\sversion\s([\d\.]{3,8})\s\((.+)\)/g"
SWIFT_VERSION=$(echo "${SWIFT_VERSION_COMMAND_OUTPUT}" | perl -nle 'if ('$SWIFT_VERSION_REGEX') { ($short, $long) = ($1, $2); print "${short}"; }')
if [[ -z $SWIFT_VERSION ]]; then echo "⛔️ Error: Could not determine Swift version."; exit 1; fi

# Output diagnostic info.
echo "Swift version: $SWIFT_VERSION"

# Set output variables.
echo "swift-version=$(echo $SWIFT_VERSION)" >> $GITHUB_OUTPUT
