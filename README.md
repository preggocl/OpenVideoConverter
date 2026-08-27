# Open Video Converter

**Open Video Converter** is a working title for a planned modern macOS video-conversion application: add videos, choose an output for a purpose, and convert a batch without having to learn video-engineering terminology.

The project’s **Phase 0** research, historical analysis, licensing review, and implementation planning remain active. There is no downloadable app yet.

The project now has an early original AppKit foundation for local development. It is not a public application release and it does not yet inspect or convert media.

## Direction

The future app is intended to combine:

- A native macOS interface that remains recognizably close to the original Miro Mac application.
- Swift and AppKit for the desktop experience.
- Modern FFmpeg and ffprobe integration, selected and packaged only after a documented review.
- Broad contemporary video input support, including VP9, AV1, and HEVC where the chosen media build supports them.
- Purpose-oriented presets for online video, devices, editing, formats, and common web delivery.
- Batch conversion, clear progress, safe output handling, and simple rotation tools.

The goal is not to build another dense professional encoder interface. The goal is to make common conversion tasks feel immediate again.

## Why now

The historic Miro projects preserved an excellent workflow, but their dependencies and preset catalogs belong to an earlier generation of devices and codecs. This project studies that work carefully while planning a current, native macOS foundation.

## Current status

Phase 0 is active. The immediate work is to establish verified historical references, audit source and asset provenance, review branding and licensing, investigate FFmpeg distribution choices, and produce an implementation-ready plan.

See [the project documentation](docs/PROJECT_OVERVIEW.md) for the scope, [the research plan](docs/PHASE_0.md) for the current work, and [the roadmap](docs/ROADMAP.md) for future phases.

## Historical context

- [pculture/mirovideoconverter](https://github.com/pculture/mirovideoconverter) — primary historical reference for the native Mac UI and behavior.
- [pculture/mirovideoconverter3](https://github.com/pculture/mirovideoconverter3) — secondary historical reference for the later rewrite.

These repositories are being examined as historical sources. Their names, code, assets, licenses, and trademarks are subject to separate review; no affiliation or endorsement is implied. Open Video Converter is not a continuation name or brand claim.

## Contributing

Contributions will be welcomed once Phase 0 establishes the project’s technical and licensing foundation. Until then, research findings, historical references, and reproducible evidence are particularly useful. Please read [CONTRIBUTING.md](CONTRIBUTING.md).

## Local development

The current foundation uses Swift Package Manager and requires macOS 14 or later.

```bash
swift test --scratch-path .build-local-tests
./script/build_and_run.sh --verify
```

The run script stages a local development `.app` under `dist/`; that folder is excluded from version control and is not a release artifact.

## License

No project license has been selected yet. The license decision depends on the Phase 0 provenance and legal review. Do not assume that the repository’s public visibility grants reuse rights beyond the rights provided by its eventual license and third-party notices.
