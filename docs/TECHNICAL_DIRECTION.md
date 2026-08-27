# Technical Direction

This document records the proposed architecture for validation during Phase 0. It is not implementation code or a final commitment.

```text
AppKit UI
  └─ Queue coordinator
       ├─ Media inspector ─── ffprobe
       ├─ Preset catalogue
       ├─ Conversion planner
       ├─ FFmpeg runner ──── ffmpeg
       └─ Output manager
```

## Responsibilities

| Component | Responsibility |
|---|---|
| AppKit UI | Native window, queue, drag/drop, menus, progress, and accessibility. |
| Queue coordinator | Item state, batch behavior, cancellation, and sequencing. |
| Media inspector | Structured media analysis from ffprobe output. |
| Preset catalogue | Validated data-defined output intentions and constraints. |
| Conversion planner | A per-item, auditable plan from media facts, preset, and user choices. |
| FFmpeg runner | Safe process invocation, progress observation, and termination. |
| Output manager | Destination, collisions, temporary output, and finalization. |

## Core rules

- Never infer media capabilities solely from an extension.
- Build process arguments as structured values, never as an unchecked shell command string.
- Preserve originals and make output collision behavior explicit.
- Verify output streams, orientation, and playback characteristics in addition to process success.
- Store presets independently from UI logic so recommendations can evolve without architectural churn.
