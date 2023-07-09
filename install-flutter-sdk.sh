#!/bin/bash

## File: install-flutter-sdk.sh
## Copyright © 2022 Muzaffar Rayyan Auhammud
## License: MIT License (https://mit-license.org/)

ANDROID_HOME=$HOME/Android/Sdk

sudo snap install flutter --classic
flutter upgrade
flutter config --android-sdk $ANDROID_HOME
flutter doctor --android-licenses
flutter doctor
flutter config --no-analytics
dart --disable-analytics

