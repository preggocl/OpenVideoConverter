# Project State

## Current phase

Phase 0 — historical analysis, licensing/branding review, and implementation planning.

## Repository baseline

- Public repository foundation: documentation only.
- No application source, Xcode project, media binary, or release artifact exists.
- Working name: Miro Video Converter 4; branding remains under review.
- Initial upstream audit completed at immutable revisions `6fae8ba` and `27efad9`; see `RESEARCH_FINDINGS.md` and `PROVENANCE_REGISTER.md`.
- Source-based UI/behavior audit completed; see `UI_AND_BEHAVIOR_AUDIT.md`.
- Private visual references for the queued/selection state were reviewed and recorded without publication; see `VISUAL_REFERENCE_NOTES.md`.
- FFmpeg/ffprobe distribution options and the verification matrix are documented; no media build has been selected.
- A staged distribution policy distinguishes experimental GitHub artifacts from later signed/notarized stable releases.
- Permission to use the historic Miro name was requested from PCF on 2026-08-27; no written authorization has been received.

## Immediate priorities

1. Complete the branding and file-level reuse review.
2. Obtain a qualified review of the project license and initial FFmpeg configuration posture.
3. Obtain permitted visual references for historical converting, completed, cancelled, and failed states if available.
4. Publish a reviewed Phase 1 implementation backlog.

## Important cautions

- Public repository visibility does not resolve licensing, trademark, or asset rights.
- Do not copy historical code/assets or bundle FFmpeg before the relevant Phase 0 review.
