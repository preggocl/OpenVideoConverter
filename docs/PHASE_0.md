# Phase 0 — Historical Analysis and Implementation Plan

## Objective

Establish a defensible technical, legal, and product foundation before application development begins.

## Workstreams

### Historical source analysis

- Record immutable revisions, licenses, notices, key directories, and third-party material in `pculture/mirovideoconverter` and `pculture/mirovideoconverter3`.
- Inspect relevant forks by actual changes, not repository age.
- Classify historical material as reference-only, potentially reusable, obsolete, unclear, or excluded.

### UI and behavior record

- Capture empty, populated, converting, completed, failed, and menu-open states of the original Mac application where evidence is available.
- Record layout, labels, menus, drag-and-drop behavior, queue semantics, and accessibility implications.
- Identify which visual elements must be recreated rather than reused pending provenance review.

### Licensing and branding

- Produce a file-level provenance register for any candidate source or asset reuse.
- Separate GPL/copyleft questions from copyright, trademark, artwork, FFmpeg, codec, and distribution questions.
- Determine a conservative fallback identity if use of the historic product name or branding is not confirmed.

### Media-distribution plan

- Evaluate FFmpeg/ffprobe source, build configuration, enabled encoders, dependencies, universal-binary strategy, updates, security response, signing, notarization, notices, and source obligations.
- Do not adopt or distribute an arbitrary third-party binary.

### Architecture and verification plan

- Validate the AppKit, queue, inspection, preset, conversion-plan, runner, and output-safety design.
- Define media fixtures, unit/integration tests, output-stream checks, visual comparison, and Intel/Apple Silicon verification.

## Exit criteria

Phase 0 finishes only when provenance, branding posture, media distribution strategy, UI record, test matrix, and a prioritized Phase 1 backlog have been reviewed and approved.

## Explicitly out of scope

No app source, Xcode project, copied historical assets, FFmpeg bundle, release package, or converter implementation is created during this phase.
