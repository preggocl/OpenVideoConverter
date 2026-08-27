# Project Overview

## Purpose

Open Video Converter is a working title for a planned modern macOS video-conversion application inspired by the clarity of the historic Miro Video Converter workflow. It should allow a person to add one or more files, choose a useful destination, and convert them safely.

## Intended experience

The main window should remain deliberately simple: a media queue at the top, a large drag-and-drop area, compact output controls below, and one obvious conversion action. Advanced controls may exist, but they must not dominate the first-use experience.

## Planned technical direction

- Native macOS application using Swift and AppKit.
- Media inspection through ffprobe.
- Conversion through a deliberately chosen, documented FFmpeg build.
- Data-defined and versioned presets rather than a catalogue embedded throughout application code.
- Local processing by default.

## Planned capability areas

- Batch queue, thumbnails, progress, per-file errors, cancellation, and safe output naming.
- Broad conventional input support, based on verified FFmpeg capabilities rather than file extensions alone.
- Modern formats such as H.264/AVC, HEVC, VP9, AV1, ProRes, and common containers where supported by the final media build.
- Purpose-oriented outputs for online delivery, compatibility, editing, formats, and generic web video.
- Rotate 90° clockwise, 90° counter-clockwise, and 180°, with a transparent choice between metadata-only handling and pixel transformation when appropriate.

## Boundaries

This is not planned as a full non-linear editor, cloud-transcoding service, or a replacement for specialist encoding tools. The initial product must remain focused, predictable, and easy to use.
