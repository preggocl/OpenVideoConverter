# Decisions

## 2026-08-27 — Phase 0 begins as a public documentation and research repository

**Context:** The project needs to become discoverable while its historical, licensing, and implementation foundations are still being established.

**Decision:** Create a public repository containing project-facing documentation and verified research only.

**Consequences:** The repository contains no converter source, historical assets, media binaries, or release packages. Public visibility does not resolve branding or license rights.

## 2026-08-27 — Use the original Mac project as the primary UI reference

**Context:** The historic native Mac application contains the desired queue, drag-and-drop, compact destination menus, and conversion workflow.

**Decision:** Treat `pculture/mirovideoconverter` as the primary source for behavioral and visual research; treat MVC3 as a secondary rewrite reference.

**Consequences:** MVC4 will recreate the experience in a modern native application rather than porting either upstream wholesale.

## 2026-08-27 — Proposed implementation direction is Swift + AppKit with ffprobe/FFmpeg

**Context:** The goal requires a faithful macOS experience and current media capabilities.

**Decision:** Plan a Swift + AppKit user interface and a separately audited ffprobe/FFmpeg media layer.

**Consequences:** Final source and distribution configuration remain contingent on Phase 0 legal and technical approval.

## 2026-08-27 — Do not adopt a user-installed or arbitrary prebuilt FFmpeg default

**Context:** Predictable conversion behavior requires version, capability, provenance, and packaging control.

**Decision:** Validate a reproducible MVC4-controlled FFmpeg/ffprobe build as the preferred candidate; do not select it yet.

**Consequences:** Phase 1 cannot integrate a media binary until its bill of materials, configuration, licensing, signing, and verification plan are approved.
