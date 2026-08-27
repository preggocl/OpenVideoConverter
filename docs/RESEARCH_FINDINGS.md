# Research Findings

_Last verified: 2026-08-27._

## Verified upstream revisions

| Repository | Verified revision | Last project commit | License shown by GitHub | Role in MVC4 research |
|---|---:|---|---|---|
| [`pculture/mirovideoconverter`](https://github.com/pculture/mirovideoconverter) | `6fae8ba4f394245b9e3d48f670367460bf175748` | 2012-09-10, “Revised README to note this repo is inactive.” | GPL-3.0 | Primary historical Mac UI and behavior reference. |
| [`pculture/mirovideoconverter3`](https://github.com/pculture/mirovideoconverter3) | `27efad91845c8ae544dc27034adb0d3e18ca8f1f` | 2012-12-28, “Bumping version to 3.0.2.” | GPL-3.0 | Secondary reference for the later rewrite and conversion organization. |

GitHub’s recent `updated_at` values for these repositories should not be interpreted as project development: their upstream `pushed_at` dates and verified head commits remain historical.

## The original Mac application

The original repository contains a real native Mac application, not merely a conceptual reference. Its `Mac/` tree includes:

- `Miro Video Converter.xcodeproj` and historical XIB resources.
- Cocoa/Objective-C classes for the root controller, drag-and-drop, task monitoring, and conversion commands.
- The queue/drop-window resources and app metadata.
- Historical packaging, updater, FFmpeg-build, and third-party material.

This confirms the original repository is the correct evidence source for MVC4’s intended visual hierarchy and interaction behavior. It does **not** authorize copying any individual source file, XIB, icon, binary, or branded asset; that requires the provenance and licensing decision recorded in this repository.

## MVC3 is not a modern macOS base

MVC3’s README describes it as an in-progress rewrite of the existing application. Its stated runtime requirements are Python 2.7, FFmpeg, GTK2, and Python GTK bindings. It is useful evidence of the project’s later conversion model, but it is not a practical implementation foundation for a current native macOS application without a broad rewrite.

## Fork comparison

The forks inspected do not provide a maintained modern successor:

| Fork | Verified divergence from MVC3 upstream | Assessment |
|---|---:|---|
| `jefferyto/mirovideoconverter3` | 0 commits ahead | Identical at the compared branch head. |
| `rulemotion/renew-mvc3` | 1 commit ahead | Historical Python/GTK conversion and widget changes; reference-only. |
| `altoplano/mirovideoconverter3` | 1 commit ahead, no file diff in the comparison | Historical synchronization/metadata movement; no product modernization found. |
| `melodyMe/melodyMe-VC` | 21 commits ahead | A renamed historical derivative with mostly branding/build/widget changes; not a current macOS continuation. |
| sampled forks of `mirovideoconverter` | identical where comparison was available | No substantive successor found in the sampled set. |

This is not a claim that no useful change exists anywhere in every fork. It is evidence that no inspected fork should become MVC4’s upstream by default.

## Historical material requiring exclusion or separate review

- The original Mac tree includes an old FFmpeg build toolchain, archived dependency tarballs, a bundled Sparkle framework, and historical updater/packaging scripts. These are reference-only until individually reviewed.
- A historical signing-related file is tracked in the original Mac distribution material. Its contents are not reproduced or used here. MVC4 must never copy it, rely on it, or preserve it in any derivative work.
- Source code license, branding, icons/artwork, old screenshots, binaries, third-party frameworks, and release infrastructure remain separate review topics.

## Current conclusion

The evidence supports a new Swift + AppKit application with a modern, independently audited media layer. The original Mac project should guide visual/behavioral fidelity; MVC3 should guide only the historical understanding of the rewrite. Neither repository should be imported wholesale.

## Sources

- [`pculture/mirovideoconverter` at `6fae8ba`](https://github.com/pculture/mirovideoconverter/tree/6fae8ba4f394245b9e3d48f670367460bf175748)
- [`pculture/mirovideoconverter3` at `27efad9`](https://github.com/pculture/mirovideoconverter3/tree/27efad91845c8ae544dc27034adb0d3e18ca8f1f)
- [FFmpeg License and Legal Considerations](https://ffmpeg.org/legal.html)
