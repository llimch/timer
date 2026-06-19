# Timer

Ultra-simple 1-minute (adjustable 10-120s) countdown timer.

- Circular progress ring + main timer digits (seconds wording) both change color together using reference chart buckets (A-O)
- Real ticking sound + finish ding (Web Audio, no files)
- Keyboard: Space = Start/Pause, R = Reset, +/- adjust time
- Works great on phone for workouts/planks
- Single file. No build. No dependencies.

## Quick local test

Just open `index.html` in any browser (double-click or drag into Chrome/Edge).

## Deploy to GitHub Pages (free hosting — recommended for single HTML file)

This project is a single `index.html` file, so GitHub Pages is the simplest way to host and run it.

### Initial setup
1. Create a new GitHub repository at https://github.com/new (do **not** initialize with README, .gitignore or license).
2. Copy the exact repository URL (e.g. `https://github.com/YOURUSERNAME/timer.git`).
3. Run the git commands in this folder (I can execute them for you).

### Enable hosting
1. Go to your repo on GitHub.
2. Click **Settings** → **Pages** (left menu).
3. Under "Build and deployment":
   - Source: **Deploy from a branch**
   - Branch: `main`
   - Folder: `/ (root)`
4. Click **Save**.

Your timer will be live at:
**https://YOURUSERNAME.github.io/YOUR-REPO/**

### Future updates
- Always follow the Version Control snapshot rule **before** editing `index.html`.
- Make your changes.
- `git add index.html README.md`
- `git commit -m "update"`
- `git push`
- GitHub Pages updates automatically (usually < 30 seconds).

### Run on iPhone
1. Open the GitHub Pages URL in Safari.
2. Tap Share → **Add to Home Screen**.
3. It works like a native app.

### Changing the Home Screen Icon
A custom icon (`timer-icon.png`) + proper PWA tags have been added.

**To update the icon on your iPhone:**
1. Delete the existing Timer icon from your home screen (long press → Remove App → Delete from Home Screen).
2. Hard-refresh the page in Safari (or wait a few minutes after deploy).
3. Tap Share → **Add to Home Screen** again.

The new icon uses a dark background with the colorful gradient ring to match the app.

Files added:
- `timer-icon.png` (256×256)
- `manifest.json`

When deploying, commit the updated files:
```bash
git add index.html timer-icon.png manifest.json README.md .gitignore
git commit -m "add custom home screen icon"
git push
```

## Notes
- Sound starts after first user click (browser security).
- Click the big number to type a specific duration.
- Fullscreen button available.
- Both progress ring (circle) AND main countdown digits (the seconds wording e.g. "0:20") use the same bucket color and blink together.
- J red blinks (with #222) in final 10s on BOTH ring and digits.

## Changes in v02 (2026-06-19)
- (Superseded) Ring temporarily set to fixed cyan. Seconds wording updated in hint. Python/build.bat references removed. Single-file HTML confirmed.
- Pre-edit snapshot: `VersionControl/index.html.v02.20260619.1413`

## Changes in v03 (2026-06-19)
- Ring color now fully controlled by reference chart buckets (first column A-O):
  - >60s: E #00AB38
  - 51-60s: C #07B9FC (cyan — matches start of Image #1 at 60s)
  - 41-50s: F #9AF000
  - 31-40s: N #B610BF
  - 21-30s: L #FF822A
  - 11-20s: K #FD4703
  - 0-10s: J #EA0034 (red)
- During countdown 10s to 0: J red blinks (alternates with track color every ~400ms).
- All other color sets (prestart, reset, duration adjust, finish) use the matching bucket color.
- Snapshot before this change: `VersionControl/index.html.v03.20260619.1424`
- No changes to sounds (still very good). No Python/build references.

## Changes in v04 (2026-06-19)
- User reported colors not visibly changing + requested BOTH circle and "second wording" (big timer digits) to change color.
- Added: during active countdown (tick), the large time digits (`.time`) now get the exact same bucket/blinked color as the ring.
- Non-countdown states (idle preview, reset, pause, finish, prestart): digits revert to white; ring still shows the correct bucket color for preview.
- Strengthened `setRingColor()` to set both SVG attribute + inline style.stroke for reliability.
- v04 snapshot taken before these fixes: `VersionControl/index.html.v04.20260619.1430`
- 20s countdown test (simulated myself via node):
  - 20s → 11s: both ring + digits = #FD4703 (K orange-red)
  - 10s → 1s: both blink between #EA0034 (J red) and #222
  - 0s: J red (finish)
- Note: within a 20s timer the main visible "change" is the switch at 10s + strong blink phase. Cross-bucket changes are more obvious on longer durations (e.g. 120s or 45s).
- Hard refresh (Ctrl+F5) recommended after edits when testing local index.html.
- Sounds unchanged.

## Changes in v05 (2026-06-19)
- Added custom home screen icon (`timer-icon.png`) so "Add to Home Screen" on iPhone looks professional instead of a page screenshot.
- Added PWA meta tags for iOS (`apple-mobile-web-app-capable`, status bar, theme-color).
- Added `manifest.json` for better PWA support.
- Icon design: dark background matching the app + the gradient ring (cyan → purple/pink) + play triangle.
- Snapshot: `VersionControl/index.html.v05.20260619.2009`
- To refresh icon on iPhone after update: delete old home screen shortcut, then re-add.

## Changes in v06 (2026-06-19)
- Fixed ticking sound not playing on iOS (PWA / Safari).
  - Replaced weak `ensureAudio` with stronger `unlockAudio()` that uses the standard iOS silent buffer trick.
  - Force unlock right before every Web Audio sound (tick, short tones, dings, finish chimes).
  - Force unlock directly on Start button tap (strongest gesture context).
  - Expanded first-interaction listeners to include touchend + pointerdown.
  - Slightly louder and longer tick for better audibility.
- SpeechSynthesis (voice) was already reliable — no change needed.
- Snapshot: `VersionControl/index.html.v06.20260619.2031`

## Project
Built as the simplest possible HTML version of a 1-minute visual timer.

## Version Control Procedure (index.html only)
Primary source file: `index.html`

**Mandatory steps BEFORE every rework or edit to index.html**:
1. Identify the next version number (v01, v02, ... — always increment by 1 from the highest existing in VersionControl/).
2. Copy the **current (pre-rework) version** of the file using this exact name format:
   `index.html.vNN.YYYYMMDD.HHMM`
   - NN = zero-padded increment (v01, v02, v10, ...)
   - YYYYMMDD.HHMM = local date+time in 24-hour format (e.g. 20260619.1245)
   - Full example: `index.html.v02.20260620.0930`
3. Target directory: `VersionControl/`
4. After the copy is done, perform the edit/rework on the working copy of `index.html` in the project root.
5. Document the change in README.md (under a new "Changes in vXX" note or in Key Fixes).
6. Test by opening `index.html` directly in a browser.

**Initial snapshot** (the working version after single-click + robust PS launch + height fixes):
- `VersionControl/index.html.v01.20260619.1245`

**v02 snapshot** (before ring color + wording changes):
- `VersionControl/index.html.v02.20260619.1413`

**v03 snapshot** (before chart-accurate bucket colors + blink):
- `VersionControl/index.html.v03.20260619.1424`

**v04 snapshot** (before making both ring + digits change color together):
- `VersionControl/index.html.v04.20260619.1430`

**v05 snapshot** (before adding iOS home screen icon + PWA tags):
- `VersionControl/index.html.v05.20260619.2009`

VersionControl/ is **history only** — do not execute files from it or modify them. The live file is always the root `index.html`.

This policy was introduced 2026-06-19 per requirements. This is a single-file HTML project only. All future edits to `index.html` must follow it exactly.