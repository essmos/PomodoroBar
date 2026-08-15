#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

VERSION="1.3.5"
APP="PomodoroBar.app"
BIN="$APP/Contents/MacOS/PomodoroBar"
DIST="dist"

echo "==> Building PomodoroBar v${VERSION} (swiftc)..."
rm -rf "$APP" "$DIST"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources" "$DIST"
mkdir -p .build/module-cache

swiftc -swift-version 5 -O -module-cache-path "$PWD/.build/module-cache" -o "$BIN" PomodoroBar.swift

echo "==> Stripping debug symbols..."
strip -x "$BIN" 2>/dev/null || true

cat > "$APP/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>PomodoroBar</string>
    <key>CFBundleDisplayName</key>
    <string>Pomodoro Bar</string>
    <key>CFBundleIdentifier</key>
    <string>local.pomodoro-bar</string>
    <key>CFBundleVersion</key>
    <string>1.3.5</string>
    <key>CFBundleShortVersionString</key>
    <string>1.3.5</string>
    <key>CFBundleExecutable</key>
    <string>PomodoroBar</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>LSMinimumSystemVersion</key>
    <string>13.0</string>
    <key>LSUIElement</key>
    <true/>
    <key>NSHumanReadableCopyright</key>
    <string>© 2025 essmos — MIT License</string>
</dict>
</plist>
PLIST

if command -v iconutil >/dev/null 2>&1 && command -v sips >/dev/null 2>&1; then
  echo "==> Generating app icon..."
  swiftc -swift-version 5 -module-cache-path "$PWD/.build/module-cache" -o .make_icon_tmp make_icon.swift
  ./.make_icon_tmp
  ICONSET="AppIcon.iconset"
  rm -rf "$ICONSET"
  mkdir -p "$ICONSET"
  while read -r size name; do
    sips -z "$size" "$size" icon_1024.png --out "$ICONSET/$name" >/dev/null
  done <<'SIZES'
16 icon_16x16.png
32 icon_16x16@2x.png
32 icon_32x32.png
64 icon_32x32@2x.png
128 icon_128x128.png
256 icon_128x128@2x.png
256 icon_256x256.png
512 icon_256x256@2x.png
512 icon_512x512.png
1024 icon_512x512@2x.png
SIZES
  iconutil -c icns "$ICONSET" -o AppIcon.icns
  cp AppIcon.icns "$APP/Contents/Resources/"
  /usr/libexec/PlistBuddy -c "Add :CFBundleIconFile string AppIcon" "$APP/Contents/Info.plist"
  rm -rf "$ICONSET" icon_1024.png .make_icon_tmp
  echo "==> Icon generated"
fi

echo "==> Ad-hoc signing..."
codesign --force --sign - "$APP" >/dev/null 2>&1 || true

echo "==> Packaging zip..."
ditto -c -k --keepParent "$APP" "$DIST/PomodoroBar-v${VERSION}.zip"
shasum -a 256 "$DIST/PomodoroBar-v${VERSION}.zip" | tee "$DIST/PomodoroBar-v${VERSION}.zip.sha256"

echo ""
echo "==> Done:"
echo "    App bundle: $APP"
echo "    Release zip: $DIST/PomodoroBar-v${VERSION}.zip"