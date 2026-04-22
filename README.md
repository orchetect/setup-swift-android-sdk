# setup-swift-android-sdk

This action is intended to perform the necessary steps to prepare the Swift Android SDK in order to build Swift packages in GitHub Actions.

## Motivation

While GitHub runners have some Android components pre-installed (including the NDK), the runners are not fully pre-configured to build Swift code for Android.

This action downloads the appropriate Swift Android SDK for the version of Swift in use on the runner and configures it so it is ready to build Swift packages.

## Input Parameters

| Name            | Required | Description                                                  | Format            |
| --------------- | -------- | ------------------------------------------------------------ | ----------------- |
| `target-triple` | Yes      | The target triple that will be used when building the Swift package. This is needed during the SDK setup process. | `true` or `false` |

## Output Parameters

The action does not output any parameters.

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    env:
      TARGET_TRIPLE: aarch64-unknown-linux-android28
    steps:
    - uses: actions/checkout@main
    - uses: orchetect/setup-swift-android-sdk@v1
      with:
        target-triple: {{ $env.TARGET_TRIPLE }}
    - name: Build Package
    - run: swift build --swift-sdk "$TARGET_TRIPLE" --static-swift-stdlib
```

## Documentation

This README serves as basic documentation.

## Author

Coded by a bunch of 🐹 hamsters in a trenchcoat that calls itself [@orchetect](https://github.com/orchetect).

## License

Licensed under the MIT license. See [LICENSE](https://github.com/orchetect/setup-swift-android-sdk/blob/main/LICENSE) for details.

## Community & Support

Please do not email maintainers for technical support. Several options are available for issues and questions:

- Questions and feature ideas can be posted to [Discussions](https://github.com/orchetect/setup-swift-android-sdk/discussions).
- If an issue is a verifiable bug with reproducible steps it may be posted in [Issues](https://github.com/orchetect/setup-swift-android-sdk/issues).

## Contributions

Contributions are welcome. Posting in [Discussions](https://github.com/orchetect/setup-swift-android-sdk/discussions) first prior to new submitting PRs for features or modifications is encouraged.

## Code Quality & AI Contribution Policy

In an effort to maintain a consistent level of code quality and safety, this repository was built by hand and is maintained without the use of AI code generation.

AI-assisted contributions are welcome, but must remain modest in scope, maintain the same degree of quality and care, and be thoroughly vetted before acceptance.
