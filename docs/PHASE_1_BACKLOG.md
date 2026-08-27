# Proposed Phase 1 Backlog

_This backlog is not authorized for implementation until Phase 0 exit criteria are approved._

## Gate before starting

- Project license and source-reuse posture approved.
- Branding direction approved, including an alternate identity if required.
- FFmpeg/ffprobe configuration, bill of materials, and distribution approach approved.
- Phase 1 scope approved as a native macOS foundation only.

## P1 — Project and build foundation

1. Create the macOS Xcode project with a reproducible Debug build and an isolated DerivedData workflow.
2. Establish architecture-specific build checks for Apple Silicon and Intel.
3. Add a minimal AppKit window that reproduces the approved empty-state layout using original Open Video Converter assets only.
4. Add project documentation/build conventions without embedding release credentials or local machine configuration.

## P2 — Inspection and model layer

1. Define the versioned media-description model.
2. Implement an ffprobe wrapper with structured arguments and fixture-based JSON parsing tests.
3. Establish queue item states and a deterministic state-transition model.
4. Add legally reusable or generated media fixtures without personal content.

## P3 — Presets and conversion plans

1. Implement versioned preset catalogue loading and validation.
2. Add a small approved baseline: maximum compatibility, high quality, small file, and one modern generic web profile.
3. Implement conversion plans with explicit video/audio/container/output/rotation policy.
4. Define output naming, collision, temporary-file, and cancellation policy.

## P4 — Controlled conversion

1. Integrate the approved FFmpeg/ffprobe build.
2. Implement serial conversion, progress parsing, cancellation, failure records, and safe publication of successful outputs.
3. Verify output stream facts and orientation against the conversion plan.
4. Deliver the historical-fidelity queue, drag-and-drop, picker, and primary conversion action.

## Definition of done for Phase 1

The foundation builds on both target architectures, inspections parse fixtures deterministically, presets validate, the UI supports intake/queue/remove states, and no conversion claim is made before the approved FFmpeg build and verification matrix are in place.
