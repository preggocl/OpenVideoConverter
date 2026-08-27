# Distribution Policy

_Phase 0 policy proposal. It applies when MVC4 has a distributable build; no build exists yet._

## Goal

Make early open-source participation possible without forcing a paid distribution program before the product is mature, while keeping the release path honest and safe.

## Distribution stages

| Stage | Channel | Signing/notarization posture | Audience and expectation |
|---|---|---|---|
| Research | Source repository only | No application artifact | People reviewing scope, documentation, and future design. |
| Alpha | GitHub Release with source and clearly labeled experimental artifact | May be unsigned and not notarized | Technically comfortable testers who understand the macOS warning and verify the release source/checksum. |
| Stable direct release | GitHub Release and/or project site | Developer ID signature and notarization | General users who expect normal macOS installation behavior. |
| Package-manager distribution | Evaluated after stable direct releases | Must not substitute for the project’s signing, integrity, or support obligations | Technical users who prefer a package manager. |

## Alpha release rules

- Label the artifact as experimental, state its exact version/commit, supported macOS version and architectures, known limitations, and checksum.
- Publish the corresponding source and third-party notices required by the selected project/media licensing model.
- Explain that an unsigned or unnotarized app can show a macOS security warning.
- Link users to Apple’s documented Privacy & Security “Open Anyway” procedure only when they independently trust the release source and wish to test it.
- Do not ask users to disable Gatekeeper globally, remove quarantine attributes with Terminal commands, bypass signature validation, or run scripts from unverified sources.
- Do not describe an alpha as a stable/safe general-user release.

## Stable direct-release rules

Before a stable direct release, use Developer ID signing, hardened runtime, notarization, a verified release package, checksums, and a clean-machine installation test. This aligns with Apple’s direct-distribution guidance for software distributed outside the Mac App Store.

## Why Homebrew is not an early substitute

Homebrew can be a useful installation channel later, but it does not replace the project’s responsibility for artifact provenance, macOS trust, signing, notarization, source availability, or support. It is therefore not a Phase 1 distribution commitment.

## Sources

- [Apple: Safely open apps on your Mac](https://support.apple.com/en-euro/102445)
- [Apple: Packaging Mac software for distribution](https://developer.apple.com/documentation/xcode/packaging-mac-software-for-distribution)
- [Apple: Notarizing macOS software before distribution](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution)
