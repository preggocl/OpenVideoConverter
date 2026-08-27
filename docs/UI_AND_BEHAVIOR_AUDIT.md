# UI and Behavior Audit

_Historical source: `pculture/mirovideoconverter` revision `6fae8ba4f394245b9e3d48f670367460bf175748`._

## Verified interaction model

The historical Mac application exposes one compact conversion flow:

```text
Choose a file or drop a file
        ↓
Select a device or format
        ↓
Inspect input format
        ↓
Convert, observe progress, cancel if needed, reveal the result
```

Evidence appears in the historical root controller, drop view, task watcher, conversion commands, and XIB connections. The UI contains actions for choosing a file, converting, cancelling, selecting a device/format, showing the output file, and opening FFmpeg diagnostic output.

## Structure worth preserving

| Historical element | Observed role | Open Video Converter direction |
|---|---|---|
| Drop zone | Receives a file through native drag-and-drop. | Preserve, expanded for a modern multi-file queue. |
| File label | Makes the selected file visible, with truncation for long names. | Preserve as per-item file naming in the queue. |
| Destination picker | Chooses a device or output format. | Preserve its compact menu-first character; replace obsolete catalog with purpose-oriented families. |
| Convert action | Starts the primary workflow. | Preserve as the single dominant action. |
| Converting view | Shows filename, percentage, progress, cancellation, and diagnostic access. | Preserve progress/cancellation; present diagnostics safely in advanced details. |
| Completion state | Communicates completion and offers reveal-in-Finder behavior. | Preserve with safe output-path handling. |

## Legacy catalog to replace

The historical code groups destinations under Android Devices, Apple Devices, and Other Devices and Formats. It includes device-specific entries such as early Android handsets, iPod variants, PSP, Kindle Fire, Theora, WebM VP8, MP4, and MP3.

Open Video Converter should retain the **picker-based simplicity**, not the old taxonomy. The proposed categories are Online, Devices/Compatibility, Editing, Format, Tools, and Advanced. They should be data-defined and versioned rather than compiled into a static source array.

## UI fidelity rules for Phase 1 design

- Preserve the familiar compact native window character, clear file selection, drag-and-drop, popup-menu interaction, direct feedback, and one primary conversion action.
- Keep the future queue above the drop area and output controls below it, while avoiding a dense editor or dashboard layout.
- Use new artwork and text unless a specific historical item is cleared for reuse.
- Adapt for modern macOS accessibility, dynamic text, keyboard navigation, VoiceOver, Retina density, and localization.
- Do not preserve historic deployment targets, old updater behavior, iTunes delivery, legacy device names, or legacy media binaries.

## Visual evidence

Private visual references confirm the historical queued composition, central drag-and-drop field, lower destination control strip, nested popup menus, and disabled primary conversion state. The images are intentionally not included in this repository. See `VISUAL_REFERENCE_NOTES.md` for the recorded observations.

## Known evidence limits

A runnable historical application has not been used as proof on a current macOS release. Before Phase 1 UI implementation, collect permitted visual references for converting, completed, cancelled, and failure states, then annotate the reconstructed UI against them.
