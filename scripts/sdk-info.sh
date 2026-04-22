#!/bin/sh

# sdk-info.sh
# setup-swift-android-sdk • https://github.com/orchetect/setup-swift-android-sdk
# © 2026 Steffan Andrews • Licensed under MIT Licens

# Inputs used:
# - SWIFT_VERSION    Swift short version (ie: "6.3")

# Step outputs produced:
# - sdk-id           SDK ID
# - sdk-url          SDK URL
# - sdk-checksum     SDK checksum

# Validate Swift version
if [[ -z $SWIFT_VERSION ]]; then echo "⛔️ Error: Swift version is empty."; exit 1; fi

# Output diagnostic info.
echo "Using Swift version $SWIFT_VERSION"

# Determine parameters for the given Swift version.
# These values are hard-coded here, as there is no viable way to retrieve historical data from Swift's server at this time. 
# Hopefully it's possible in future.
case $SWIFT_VERSION in
  6.3)
    SDK_ID="swift-6.3-RELEASE_android"
    SDK_URL="https://download.swift.org/swift-6.3-release/android-sdk/swift-6.3-RELEASE/swift-6.3-RELEASE_android.artifactbundle.tar.gz"
    SDK_CHECKSUM="2f2942c4bcea7965a08665206212c66991dabe23725aeec7c4365fc91acad088" ;;
  6.3.1)
    SDK_ID="swift-6.3.1-RELEASE_android"
    SDK_URL="https://download.swift.org/swift-6.3.1-release/android-sdk/swift-6.3.1-RELEASE/swift-6.3.1-RELEASE_android.artifactbundle.tar.gz"
    SDK_CHECKSUM="8193a4e96538635131a154736c8896fba0e5a1c30e065524f00ed78719bac35a" ;;
  *)
    echo "⛔️ Error: Unhandled Swift version: $SWIFT_VERSION. Please update script with URL and checksum for this version."; exit 1 ;;
esac

# Output diagnostic info.
echo "SDK ID: $SDK_ID"
echo "SDK URL: $SDK_URL"
echo "SDK checksum: $SDK_CHECKSUM"

# Set output variables.
echo "sdk-id=$(echo $SDK_ID)" >> $GITHUB_OUTPUT
echo "sdk-url=$(echo $SDK_URL)" >> $GITHUB_OUTPUT
echo "sdk-checksum=$(echo $SDK_CHECKSUM)" >> $GITHUB_OUTPUT
