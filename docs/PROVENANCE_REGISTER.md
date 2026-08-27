# Provenance Register

This register records the initial classification of historical material. It is intentionally conservative.

| Material | Historical location | Classification | MVC4 rule |
|---|---|---|---|
| Product workflow and UI behavior | `pculture/mirovideoconverter`, Mac application tree | Reference-only | Recreate from documented behavior after review. |
| Cocoa/Objective-C source | `Mac/Classes/` | Candidate GPL-covered source | Do not copy or port until the project license and reuse decision are approved. |
| XIB resources | `Mac/*.xib`, `Mac/English.lproj/` | Candidate copyright/asset material | Use for observation; do not copy before asset review. |
| Icons, images, visual branding | historical Mac assets and packaging | Unclear | Do not reuse. Create or license new assets after the branding decision. |
| Old FFmpeg binary/build scripts/dependency archives | `Mac/FfmpegCompile/` and historical app material | Obsolete, third-party review required | Never distribute or revive. Build a separate current strategy. |
| Sparkle framework and updater material | `Mac/Sparkle.framework/` and packaging | Third-party material | Do not copy. Evaluate a current update approach separately if needed. |
| Historical signing/release material | `Mac/DMG/` | Excluded | Do not inspect for use, copy, publish, or depend on it. |
| MVC3 Python/GTK code | `pculture/mirovideoconverter3/mvc/` | Reference-only by default | Do not port wholesale; use only for historical design analysis. |

## Required before implementation

For every material reclassified as reusable, record its repository revision, path, copyright/license notice, intended use, review outcome, and required attribution or source obligations.
