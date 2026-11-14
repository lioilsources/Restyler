# Anonymous usage statistics

Restyler sends a small set of anonymous usage events through the shared
`ol1n_telemetry` package (<https://github.com/lioilsources/Ol1nTelemetry>,
tag `v0.1.0`), so the owner can see where new users drop off in the wizard,
how long the wait for the render server is and when people give up on it.
This file is the **event dictionary**: the constant `restylerDictionary`
(`lib/telemetry/telemetry_dictionary.dart`) and this document list exactly
the same events and properties, and `test/telemetry_test.dart` fails when
they drift apart. The plan behind it is `DevConventions/Prompts/04-PLAN-analytika.md`.

Adding an event or a property is a change to the privacy policy
(`docs/privacy.html`) and to the store privacy answers. Ask the owner first.

## Rules

The rules of `ol1n_telemetry` apply unchanged: no persistent identifier,
cohorts computed on the device, only enums, bands and numbers, no key → no
network, off wipes the queue at once, measuring never steers the app. See the
package README.

On top of that, for Restyler:

- **Nothing about the photo.** No selfie, mask, prompt, render output, file
  name, project id, job id or error message leaves the device through the
  statistics. Look and style picks are ids from the app's fixed catalogs
  (`tsumiki_shared`); anything outside them is `other`.
- **Nothing through the render backend.** The statistics have their own
  receiver and their own key (`TELEMETRY_KEY`, `TELEMETRY_HOST`). They never
  use `RESTYLER_APP_TOKEN`, the API address or `BackendClient`, and the
  render API never sees them.

## Configuration

| `--dart-define` | Meaning |
|---|---|
| `TELEMETRY_KEY` | Restyler's key at the collector. Empty → nothing is recorded or sent. |
| `TELEMETRY_HOST` | The collector's base address, `https`. Empty → nothing is recorded or sent. |
| `TELEMETRY_DEBUG` | `true` prints events to the console instead of sending them. |
| `TELEMETRY_TESTER` | `true` marks the build as a tester build (`tester: true`). |

`release-ios.yml` and `release-android.yml` pass `TELEMETRY_KEY` and
`TELEMETRY_HOST` from the GitHub secrets of the same names. An absent secret
is an empty string: the build is silent and the statistics switch is not
shown. The key and the collector's address never go into this public
repository.

The switch is in the ⋮ menu on the home screen (*Anonymní statistiky* /
*Anonymous statistics*), only in builds that have a key. A long press on the
title *Restyler* marks the device as a tester device (hidden; for the
owner's own phones).

Storage: `FileTelemetryStore` in `<application support>/telemetry`.
`hadDataBefore` is true when the device already has booth projects, so an
existing user is `days_band: pre`, not a new install.

## Activation

The first render output saved on the device (the first frame or clip of a
booth that reached the phone). Once per install.

## Features

`mix` (a ready style mix), `search` (style search), `photo_medium` (a style
rendered as a photo), `strip_layout` (the strip instead of the grid),
`save_photos`, `share`, `animate` (opened Oživit), `clip_play`, `fill_in`
(Dodělat), `delete` (a booth deleted).

## Screens

`home`, `selfie`, `beard`, `glasses`, `hair`, `styles`, `booth`, `clip`
(route names in `kScreenRoutes`; anything else is `other`). The motion sheet
does not change the screen.

## The restyle flow

`restyle_start` / `restyle_end` wrap every render the app waits for: a new
booth, Spustit znovu, Dodělat, Oživit and a clip retried. It is the event
that shows where people leave while waiting for the GPU:

- `stage` says where the wait was when the flow ended: `upload` (the POST,
  before the server took the job), `queue` (taken, nothing started),
  `render` (a step started) or `done`.
- `secs` counts only the time the app was in the foreground, `wait_secs` the
  wall-clock time since the start. A large gap means the user put the phone
  away while waiting.
- `result: background` is the parked end: the app went to the background
  during the render and the process never came back. If the user returns,
  the parked end is dropped and the flow goes on to its real result.
- A render picked up again after the app was killed (`resumeAll`) has no
  flow of its own; its first process already reported `background`.

| `result` | Meaning |
|---|---|
| `ok` | every step has an output |
| `partial` | some steps have an output, some failed (refunded) |
| `error` | the render failed, or the server answered 5xx to the POST |
| `queued` | the render server's GPU queue was full, nothing rendered (refunded) |
| `timeout` | no answer: the POST timed out or the network was down |
| `refused` | 429, another render of this user is still running |
| `rejected` | 401, 403 or 422: the server refused this build or this plan |
| `lost` | the server restarted and forgot the job (404 while polling) |
| `filtered` | the server's nudity check threw a frame away (refunded) |
| `cancel` | the booth was deleted while it rendered |
| `background` | the app went away mid-render and never came back |

## Reading the data

`store-metrics report restyler` on JODA. Questions this dictionary answers
(plan §1):

| Question | Events |
|---|---|
| What a new user does first | `app_open` → `screen_view` (selfie, look steps, styles) → `analyse_end` → `restyle_start` → `activation` |
| Where the wizard loses people | `screen_leave` per step, `look_step.choice`, `error_shown` on `selfie` |
| How long the GPU wait is, and who gives up | `restyle_end.result`, `stage`, `secs`, `wait_secs` |
| Which looks and styles are used | `look_step.item`, `style_pick.style` |
| What advanced users never use | `feature_snapshot` |
| Do they keep the result | `export_end` (`target`, `result`) |

## Common properties

Sent with every event.

| Property | Type | Values |
|---|---|---|
| `app_version` | enum | the app version (`kAppVersion`, checked against `pubspec.yaml`) |
| `platform` | enum | `ios`, `android`, `macos`, `windows`, `linux`, `other` |
| `lang` | enum | the app's language, one of `AppLocalizations.supportedLocales` (`cs`, `en`) |
| `session_band` | band | session number: `1`, `2`, `3-5`, `6-10`, `11+` |
| `days_band` | band | days since measuring began: `0`, `1`, `2-6`, `7-29`, `30+`, `pre` |
| `first_session` | bool | the very first session of a new install |
| `tester` | bool | tester build (`TELEMETRY_TESTER`) or tester device |

## Events

### `app_open`

Cold start, or a new session after more than 30 minutes in the background.
Answers: how many installs come back for the 2nd, 3rd, 6th and 11th session.

| Property | Type | Values |
|---|---|---|
| `start` | enum | `cold`, `resume` |
| `session_band_first` | bool | the first session of this install in its `session_band` |
| `days_band_first` | bool | the first session of this install in its `days_band` |
| `campaign` | campaign | optional; QR campaign of a new install, `^[a-z0-9-]{1,24}$` (Restyler sends none) |

### `screen_view`

A screen appeared. Answers: the path through the wizard.

| Property | Type | Values |
|---|---|---|
| `screen` | enum | `home`, `selfie`, `beard`, `glasses`, `hair`, `styles`, `booth`, `clip`, `other` |
| `prev` | enum | the previous screen, or `none` |

### `screen_leave`

A screen was left. Answers: how long people spend on each step.

| Property | Type | Values |
|---|---|---|
| `screen` | enum | as in `screen_view` |
| `secs` | int | foreground seconds on the screen |
| `actions` | int | app events, feature uses and locked taps during the stay |

### `session_pause`

The app went to the background or is closing. Sent at once. Answers: when
and where people stop.

| Property | Type | Values |
|---|---|---|
| `active_secs` | int | foreground seconds in this session |
| `screen` | enum | the screen at the time, or `none` |
| `screen_secs` | int | foreground seconds on that screen |

### `activation`

The first render output saved on this install. Once per install. Answers:
how many new users get a result at all, and how fast.

| Property | Type | Values |
|---|---|---|
| `secs` | int | seconds since this session's `app_open` |

### `feature_use`

The first use of a feature in a session. Answers: which features are used.

| Property | Type | Values |
|---|---|---|
| `feature` | enum | `mix`, `search`, `photo_medium`, `strip_layout`, `save_photos`, `share`, `animate`, `clip_play`, `fill_in`, `delete` |

### `feature_snapshot`

After `app_open` of the 3rd, 6th and 11th session: which features this
install has ever used. Answers: what advanced users never touch.

| Property | Type | Values |
|---|---|---|
| `f_mix` | bool | a ready mix used |
| `f_search` | bool | style search used |
| `f_photo_medium` | bool | a style rendered as a photo |
| `f_strip_layout` | bool | the strip layout chosen |
| `f_save_photos` | bool | saved to Photos |
| `f_share` | bool | shared |
| `f_animate` | bool | Oživit opened |
| `f_clip_play` | bool | a clip played |
| `f_fill_in` | bool | Dodělat used |
| `f_delete` | bool | a booth deleted |
| `features_used` | int | how many of them |

### `error_shown`

The user saw an error. Answers: where people struggle.

| Property | Type | Values |
|---|---|---|
| `kind` | enum | photo checks: `no_face`, `face_too_small`, `mask_too_small`, `mouth_not_visible`, `no_beard_to_shave`, `eyes_not_visible`, `mask_too_large`, `no_glasses_to_remove`, `mask_other`, `photo`, `analysis`; render: `offline`, `busy` (429), `queue_full`, `auth`, `not_found`, `plan_rejected`, `server`, `lost`, `nude`, `render_failed`, `retired_style`; booth: `nothing_ready`, `export`; `other` |
| `screen` | enum | the screen at the time, or `none` |

### `analyse_start`

A selfie was picked and the on-device analysis began (face parsing, masks).

| Property | Type | Values |
|---|---|---|
| `source` | enum | `camera`, `gallery` |

### `analyse_end`

The analysis ended. Answers: how many selfies the app rejects, and how long
the on-device analysis takes (`secs`).

| Property | Type | Values |
|---|---|---|
| `result` | enum | `ok`, `error` (the kind goes in `error_shown`), `cancel`, `background` |
| `secs` | int | foreground seconds |

### `look_step`

A look step (beard, glasses, hair) was left forward with Další or Nechat.
Answers: which steps people skip, and which looks they pick.

| Property | Type | Values |
|---|---|---|
| `step` | enum | `beard`, `glasses`, `hair` |
| `choice` | enum | `change` (a look picked), `keep` (Nechat), `blocked` (the step was closed on this photo) |
| `item` | enum | the picked id from `kBeards`, `kGlasses`, `kHairstyles` or `keep-cut`; `none` when not changed; `other` |
| `colour` | enum | the hair colour id from `kHairColours` on the hair step; otherwise `none`; `other` |

### `style_pick`

One per frame when a new booth starts. Answers: which styles are used.

| Property | Type | Values |
|---|---|---|
| `style` | enum | the style id from `kRestyleStyles`; `other` for a style no longer in the catalog |
| `medium` | enum | `illustration`, `photo` |

### `restyle_start`

The app posted a render (see *The restyle flow*).

| Property | Type | Values |
|---|---|---|
| `kind` | enum | `booth`, `retry` (Spustit znovu), `fill_in` (Dodělat), `clip` (Oživit), `clip_retry` |
| `steps` | int | steps in the plan |
| `cost` | int | `RenderPlan.cost`, generations |
| `beard` | bool | the plan changes the beard |
| `glasses` | bool | the plan changes the glasses |
| `hair` | bool | the plan changes the hair |
| `motion` | enum | the motion id from `kMotions` for a clip; `none` otherwise; `other` |

### `restyle_end`

The render ended, or the app left it. Answers: how many renders succeed,
how long the wait is, where people give up.

| Property | Type | Values |
|---|---|---|
| `result` | enum | `ok`, `partial`, `error`, `queued`, `timeout`, `refused`, `rejected`, `lost`, `filtered`, `cancel`, `background` |
| `secs` | int | foreground seconds |
| `stage` | enum | `upload`, `queue`, `render`, `done` |
| `wait_secs` | int | wall-clock seconds since `restyle_start` |
| `frames_ok` | int | steps with an output |

### `export_start`

Uložit do Fotek or Sdílet was tapped on a booth.

| Property | Type | Values |
|---|---|---|
| `target` | enum | `photos`, `share` |
| `layout` | enum | `grid`, `strip` |

### `export_end`

The export ended. Answers: do people keep or share their result.

| Property | Type | Values |
|---|---|---|
| `result` | enum | `ok`, `cancel` (share sheet dismissed), `empty` (no frame ready), `error`, `background` |
| `secs` | int | foreground seconds |
