# Architecture

_The AppKit foundation and domain models are now implemented locally. Media inspection, conversion, and output management remain proposed until the Phase 0 media decision is approved._

```text
AppKit interface
  └─ Queue coordinator
       ├─ Media inspector ─── ffprobe
       ├─ Preset catalogue
       ├─ Conversion planner
       ├─ FFmpeg runner ──── ffmpeg
       └─ Output manager
```

## Components

| Component | Responsibility |
|---|---|
| AppKit interface | Window, queue, file intake, menu presentation, progress, keyboard access, and VoiceOver. |
| Queue coordinator | Owns item state transitions and serial batch behavior for the first release. |
| Media inspector | Converts ffprobe JSON into a versioned media description. |
| Preset catalogue | Loads, validates, versions, and exposes purpose-oriented preset data. |
| Conversion planner | Combines inspected input, preset constraints, and approved overrides into an auditable per-item plan. |
| FFmpeg runner | Executes structured process arguments, receives progress, supports cancellation, and captures safe diagnostics. |
| Output manager | Creates temporary output, handles conflicts, atomically publishes successful results, and preserves originals. |

## Data flow

```text
File URL → inspection → media description → preset + options
       → conversion plan → ffmpeg execution → verified output → queue state
```

## Invariants

- Original media is never altered.
- Extensions alone never determine codec/container support.
- No unchecked shell command is assembled from filenames or settings.
- A preset is an intent and constraint set, not a prewritten command line.
- A queue item cannot reach Completed until its final output is present and its stream facts are checked.
- Cancellation and failure do not present a temporary/partial file as a completed output.

## Deferred concerns

Parallel conversion, custom preset editing, updater architecture, telemetry, cloud processing, and cross-platform support are outside the initial architecture commitment.
