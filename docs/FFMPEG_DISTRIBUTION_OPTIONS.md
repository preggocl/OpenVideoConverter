# FFmpeg and ffprobe Distribution Options

_Phase 0 decision record. No FFmpeg binary has been selected or distributed._

## Requirements

Open Video Converter needs `ffprobe` for structured input inspection and `ffmpeg` for conversion. The eventual distribution must be reproducible, signed as part of the product, auditable by revision/configuration, compatible with the supported Mac architectures, and accompanied by the notices and source materials required by the exact build.

## Options considered

| Option | Advantages | Limitations | Status |
|---|---|---|---|
| Require a user-installed FFmpeg | Small app bundle; no embedded media binary. | Unpredictable capabilities, support burden, inconsistent versions, weak first-use experience. | Rejected as the default product path. |
| Download a prebuilt binary at build or run time | Fast initial setup. | Provenance, reproducibility, security, signing, update, and license-delivery risks. | Rejected. |
| Build and distribute Open Video Converter-controlled command-line executables | Stable behavior; exact bill of materials; straightforward inspection and test fixtures. | Requires ongoing build, signing, source-delivery, and security maintenance. | Preferred candidate for validation. |
| Link a custom app directly to FFmpeg libraries | Potentially tighter integration. | More complex build, runtime, licensing, ABI, signing, and debugging model; not necessary for the initial product. | Deferred. |

## Proposed validation path

The leading option is a reproducible Open Video Converter-controlled build of `ffmpeg` and `ffprobe`, placed as separately signed executables inside the application bundle. The build proposal must document:

1. FFmpeg source revision and integrity record.
2. Separate arm64 and x86_64 build steps, plus the universal-binary approach if adopted.
3. Exact `configure` arguments and every enabled external library/encoder.
4. License, source, attribution, and change-diff material for FFmpeg and all included dependencies.
5. Hardened-runtime compatibility and code-signing order for nested executables.
6. Version update, security-response, rollback, and regression-test policy.

No configuration is approved yet. Features such as GPL-enabled components, nonfree components, x264, x265, libvpx, rav1e, SVT-AV1, or platform encoders must be decided individually against capability, licensing, distribution, and maintenance requirements.

## Legal and release implications

FFmpeg explains that its licensing depends on the configured components: the default core is LGPL 2.1-or-later, while optional GPL components make the resulting FFmpeg build GPL. Its own checklist also calls for source corresponding exactly to distributed binaries and a documented build configuration. See [FFmpeg License and Legal Considerations](https://ffmpeg.org/legal.html).

For direct macOS distribution, Apple’s current guidance requires valid Developer ID signatures, hardened runtime, secure timestamps, and notarization for the normal distribution workflow. Every nested executable must be included in the eventual signing and verification process. See [Apple’s notarization guidance](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution).

## Decision gates before Phase 1 media integration

- Approved project-license posture and source-reuse decision.
- Reproducible test build on both target architectures.
- Bill of materials and notices validated for the exact configuration.
- Signing/notarization trial using a disposable development artifact.
- Fixture matrix passes with inspected stream/output assertions.
- Explicit approval of the first supported encoder and preset set.
