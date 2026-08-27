# Verification Matrix

This matrix defines the evidence required before claiming a capability. It is a Phase 0 test plan, not evidence that any conversion currently works.

## Build and packaging

| Area | Required evidence |
|---|---|
| Apple Silicon build | Executable architecture, signature verification, launch test, and media fixture run. |
| Intel build | Executable architecture, signature verification, launch test, and media fixture run. |
| Universal distribution, if used | `lipo` architecture evidence and tests on both hardware families. |
| Nested executables | Signature verification of app, `ffmpeg`, `ffprobe`, and all shipped code. |
| Notarization | Submitted artifact, accepted status, stapled ticket where applicable, and clean-machine launch check. |
| Release package | Archive integrity, checksum, contents inventory, notices/source links, and release notes. |

## Media inspection fixtures

Each fixture must be legally redistributable or generated for testing. Store no personal media in the repository.

| Fixture class | Expected inspection assertions |
|---|---|
| H.264/AAC MP4 | Container, video/audio codec, dimensions, frame rate, duration. |
| HEVC MP4 or MOV | Codec, pixel format, color metadata, dimensions. |
| VP9/Opus WebM | Container and stream identification independent of extension. |
| AV1 file | Correct video codec recognition and supported/unsupported output guidance. |
| ProRes MOV | Profile, dimensions, audio stream recognition. |
| Rotated video | Rotation/display matrix interpretation and resulting visual orientation. |
| Audio-only file | Absence of video stream and applicable output options. |
| Subtitle-bearing file | Stream detection and preserved/unsupported policy. |
| Corrupt/truncated file | Human-readable failure state without crash or unsafe output. |

## Conversion assertions

For every approved preset, verify:

1. Planned output path follows collision and temporary-file policy.
2. Input original remains byte-for-byte unchanged.
3. Process cancellation leaves no misleading completed state or unsafe partial final file.
4. Output stream/container/codec/dimensions/orientation match the conversion plan.
5. Output opens in at least one appropriate macOS playback path.
6. Failure output provides a safe diagnostic record without exposing unrelated paths or confidential data.

## User-flow checks

- Drag-and-drop of one file and multiple files.
- File-picker intake and remove/cancel behavior.
- Empty queue, queued, analyzing, converting, completed, cancelled, and failed states.
- Keyboard operation and VoiceOver-readable controls/status.
- Output reveal in Finder.
- Preset fallback or explanation when a requested encoder is unavailable.

## Initial release claim rule

No codec, preset, platform destination, hardware-acceleration path, or architecture is listed as supported publicly until it satisfies this matrix on the exact shipped media build.
