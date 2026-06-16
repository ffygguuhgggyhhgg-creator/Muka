[app]

# Package name
title = TG RADAR
package.name = tgradar
package.domain = org.tgradar

# Source
source.dir = .
source.include_exts = py,png,jpg,kv,atlas,ttf

# Version
version = 1.0.0

# Requirements (pure Python only — no Rust/C extensions needed)
requirements = python3,kivy,requests

# Android
android.api = 34
android.minapi = 21
android.sdk = 34
android.ndk = 27
android.ndk_path =
android.sdk_path =
android.accept_sdk_license = True
p4a.bootstrap = sdl2
android.permissions = INTERNET,POST_NOTIFICATIONS,FOREGROUND_SERVICE,RECEIVE_BOOT_COMPLETED
android.manifest.intent_filters =
android.add_src =
android.add_src_version =
android.non_deprecated =
android.allow_deprecated =
android.private_data_storage =
android.wakelock = True
android.verify_local_packages = True
android.verify_installed_packages = True
android.app_lib_enabled = True
android.enable_androidx = True
android.use_samsung_default_icon = False

# Kivy
osx.python_version = 3
ios.python_version = 3
presplash.color = #1a1a2e
icon = data/icon.png

# Display
orientation = portrait
fullscreen = 0

# Build
log_level = 2
archs = arm64-v8a
debug = 1
release = 0
