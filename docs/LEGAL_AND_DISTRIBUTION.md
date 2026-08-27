# Legal and Distribution Workstream

## Current position

Open Video Converter is public and now contains original implementation code, but has no project license or public application release yet. Public visibility does not settle reuse rights, licensing, trademarks, patents, or distribution compliance.

The two historical repositories currently identify GPL-3.0. If Open Video Converter distributes code derived from GPL-covered upstream material, its licensing and source-distribution obligations must be designed and reviewed before release.

## Separate decisions

| Decision | Status |
|---|---|
| Open Video Converter project license | Pending source-reuse decision. |
| Use of historic source code | Pending file-level provenance review. |
| Use of “Miro Video Converter 4” / “Miro” | Permission requested from PCF on 2026-08-27; written response pending. |
| Historic logos, icons, text, and screenshots | Not approved for reuse. |
| FFmpeg/ffprobe source and build configuration | Pending. |
| Enabled codecs, external libraries, and regional distribution implications | Pending qualified review. |
| macOS signing, notarization, source delivery, notices, and updates | Pending release design. |

## FFmpeg baseline

FFmpeg states that its core is LGPL 2.1-or-later by default, while optional GPL-covered components can make the FFmpeg build GPL. The license and obligations therefore depend on the **exact** source revision and configuration selected. Open Video Converter will not bundle FFmpeg until it has a bill of materials, configure/build record, corresponding-source delivery plan, notices, and review of all enabled external libraries.

See [FFmpeg’s legal guidance](https://ffmpeg.org/legal.html). It is technical guidance rather than legal advice; legal review remains required before a public application distribution.

## Phase 0 deliverables

1. File-level reuse register and attribution plan.
2. Branding-risk decision and alternate public identity if required.
3. FFmpeg bill of materials and reproducible build proposal.
4. Distribution checklist covering code, notices, source access, signing, notarization, updates, and release artifacts.
5. A documented project license decision before implementation source is published.

## Branding operating rule while permission is pending

No new public release, product asset, application bundle, or promotional claim may use the Miro names, logos, or icons. The existing repository references the historic project only to document the permission request and research context. A written authorization or a distinct replacement identity is required before Phase 1 begins.
