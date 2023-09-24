[![codecov](https://codecov.io/github/YazeedAlKhalaf/alyamamah/branch/main/graph/badge.svg?token=AS27LN330N)](https://codecov.io/github/YazeedAlKhalaf/alyamamah)
[![Codemagic build status](https://api.codemagic.io/apps/64057683f94c592e7c8a026b/64057683f94c592e7c8a026a/status_badge.svg)](https://codemagic.io/apps/64057683f94c592e7c8a026b/64057683f94c592e7c8a026a/latest_build)

![feature-graphic](./readme_images/feature-graphic.png)

# 📚 Al Yamamah

> Simplifying student life, one feature at a time.

### 🌟 Features:

- 📅 **Schedule Builder**: Create and manage your own personalized university schedule. Easily add, edit, or remove classes, and see how they fit into your week.
- 📅 View your complete university schedule at a glance.
- 📲 Quick schedule widget for your home screen (iOS and Android).
- ❌ Monitor your absences in real-time.
- 📈 Access your academic grades.
- 🧑‍🎓 Customize and preview your profile.
- 🌍 Arabic & English language compatibility.
- 🌛 Toggle between Dark and Light modes.

### 📱 Supported Platforms:

- iOS ✅
- Android ✅

### 🚧 Platforms In Progress:

- **Windows & Linux**: Awaiting Firebase plugin support.
- **Web**: Tackling CORS and SSL issues with the edugate API.
- **macOS**: Some glitches post-integration with Revenue Cat.

## 🚀 Getting Started:

To set this up, you'll need a working Flutter environment. If you haven't got Flutter on your machine, [get it here](https://docs.flutter.dev/get-started/install).

Steps:

1. Clone the repo:

```
git clone git@github.com:YazeedAlKhalaf/alyamamah.git
```

1. Navigate into the directory:

```
cd alyamamah
```

3. Set up Firebase:
   - Start a Firebase project for analytics.
   - Use the `flutterfire` cli for easy setup. If you're not using my Firebase project, you'll miss some features (you won't have the required secrets for certain Firebase APIs).
   - You'll need to add the following:
     1. `android/app/google-services.json`
     2. `ios/Runner/GoogleService-Info.plist`
     3. `macos/Runner/GoogleService-Info.plist`
     4. Create `lib/firebase_options.dart` by copying `lib/firebase_options.dart.example` and populating it with your Firebase data.
     5. Note: The `flutterfire` cli will generate two files for iOS and macOS. Use the example JSON files provided if you run into issues:
        1. `ios/firebase_app_id_file.json`
        2. `macos/firebase_app_id_file.json`
4. Fetch dependencies:

```
flutter pub get
```

5. Run the app (ensure you have a simulator, emulator, or real device connected):

```
flutter run
```

💡 **Demo Mode**: Don't have an Al Yamamah University account? Use the demo credentials:

- Username: `200011150`
- Password: `Aa1234aa@`

Get an inside look at how this works in the [demo interceptor](https://github.com/YazeedAlKhalaf/alyamamah/blob/main/lib/core/services/api/interceptors/demo_mode_interceptor.dart).

## How to generate files from proto?

You need two things:

- protoc
- the protoc plugin for dart
  Follow this guide: https://github.com/google/protobuf.dart/tree/master/protoc_plugin#how-to-build

Or you can basically run this command to install the dart plugin for protoc:

```
dart pub global activate protoc_plugin
```

## 🎨 Icon Generation:

For updating or generating icons, run:

```
flutter pub run flutter_launcher_icons
```

## 💖 Special Thanks to Our Sponsors:

<a href="https://sentry.io"><img src="https://raw.githubusercontent.com/YazeedAlKhalaf/alyamamah/main/readme_images/sentry-logo.png" width="150px" alt="sentry logo as a sponsor" /></a>
