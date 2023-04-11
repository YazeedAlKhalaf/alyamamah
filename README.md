[![codecov](https://codecov.io/github/YazeedAlKhalaf/alyamamah/branch/main/graph/badge.svg?token=AS27LN330N)](https://codecov.io/github/YazeedAlKhalaf/alyamamah)
[![Codemagic build status](https://api.codemagic.io/apps/64057683f94c592e7c8a026b/64057683f94c592e7c8a026a/status_badge.svg)](https://codemagic.io/apps/64057683f94c592e7c8a026b/64057683f94c592e7c8a026a/latest_build)

![feature-graphic](./readme_images/feature-graphic.png)

# Al Yamamah

Al Yamamah make students lives easier.

Features:

- View your schedule easily
- Widget to view the schedule from your home screen (iOS only)
- Widget to view the schedule from your home screen
- See the absences directly
- Preview your profile and edit it seamlessly
- Arabic and English language support
- Dark and Light mode support

Currently the app supports the following platforms:

- iOS
- Android
- macOS

Those platforms have some issues but are planned to be supported in the future:

- Web:
  - CORS issue.
  - After adding Firebase it stopped even launching, error screen from the beginning.
- Windows:
  - No Firebase support yet for plugins I use.
- Linux:
  - No Firebase support yet for plugins I use.

## How to run the app?

This is a Flutter app. You must have Flutter installed and working on your machine. Do that if you didn't yet by following their official documentation:
https://docs.flutter.dev/get-started/install

Now for the fun part:

1. `git clone git@github.com:YazeedAlKhalaf/alyamamah.git`
2. `cd alyamamah`
3. Create a Firebase project, and set it up. This will be needed because the app uses Firebase for analytics. Use the `flutterfire` cli and you should be good to go! You can run it with my project but you won't be able to use some features since you don't have some of my secrets that are required for connecting to some Firebase APIs. Currently you need to add four files or use the later method. The files are:
   1. `android/app/google-services.json`
   2. `ios/Runner/GoogleService-Info.plist`
   3. `macos/Runner/GoogleService-Info.plist`
   4. `lib/firebase_options.dart` by copying `lib/firebase_options.dart.example` and filling it with data from the files above.
   5. If you use the `flutterfire` cli, it will generate two files in iOS and macOS folders. Not sure why but I kept an example json file in those places in case you need it to run the app:
      1. `ios/firebase_app_id_file.json`
      2. `macos/firebase_app_id_file.json`
4. `flutter pub get`
5. `flutter run`, make sure a simulator, an emulator, or a real device is connected.

This app calls the university API. If you don't have an account at Al Yamamah University, use the demo account:

- Username: `200011150`
- Password: `Aa1234aa@`

If you are ineterested in how this works, see the demo interceptor [here](https://github.com/YazeedAlKhalaf/alyamamah/blob/main/lib/core/services/api/interceptors/demo_mode_interceptor.dart).

## How to generate icons?

Run the following command:

```
flutter pub run flutter_launcher_icons
```
