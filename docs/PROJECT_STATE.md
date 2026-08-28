# Project State

## Current phase

Phase 1 foundation — original AppKit implementation, with Phase 0 branding and media-distribution decisions still open.

## Repository baseline

- Public repository contains documentation and original source code; no public binary or release artifact exists.
- Working title: Open Video Converter. The historic Miro name is not used as the product identity while permission is pending.
- Initial upstream audit completed at immutable revisions `6fae8ba` and `27efad9`; see `RESEARCH_FINDINGS.md` and `PROVENANCE_REGISTER.md`.
- Source-based UI/behavior audit completed; see `UI_AND_BEHAVIOR_AUDIT.md`.
- Private visual references for the queued/selection state were reviewed and recorded without publication; see `VISUAL_REFERENCE_NOTES.md`.
- FFmpeg/ffprobe distribution options and the verification matrix are documented; no media build has been selected.
- A staged distribution policy distinguishes experimental GitHub artifacts from later signed/notarized stable releases.
- Permission to use the historic Miro name was requested from PCF on 2026-08-27; no written authorization has been received.
- Original AppKit foundation added with no FFmpeg integration. Its empty state follows the documented spatial composition, and selected files now appear in a compact queue strip that displays up to three individual rows with removal controls and indicates when additional items remain. Local Debug build and four automated tests pass on the current x86_64 development machine.

## Immediate priorities

1. Verify the compact multi-item queue treatment against permitted visual evidence.
2. Complete the branding and file-level reuse review.
3. Obtain a qualified review of the project license and initial FFmpeg configuration posture.
4. Obtain permitted visual references for historical converting, completed, cancelled, and failed states if available.

## Important cautions

- Public repository visibility does not resolve licensing, trademark, or asset rights.
- Do not copy historical code/assets or bundle FFmpeg before the relevant Phase 0 review.
