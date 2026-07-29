# Medimind

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![License](https://img.shields.io/badge/License-MIT-green.svg)

Medimind is a Flutter application that helps users manage their medications by tracking prescriptions, scheduling reminders, monitoring remaining pill quantities, and notifying users when it's time to refill their medicine. All prescription data is stored locally using Hive.

🚧 This project is under active development.

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- A connected device, emulator, or simulator (Android/iOS), or a desktop/web target enabled in Flutter

### Installation

1. Clone the repository
```bash
   git clone https://github.com/Assassin121YT/Medimind.git
   cd Medimind
```

2. Install dependencies
```bash
   flutter pub get
```

3. Generate Hive type adapters (if using `build_runner`)
```bash
   flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app
```bash
   flutter run
```

   To target a specific platform:
```bash
   flutter run -d chrome      # Web
   flutter run -d windows     # Windows desktop
   flutter run -d <device-id> # Specific emulator/device (see `flutter devices`)
```

### Building a release

```bash
flutter build apk        # Android
flutter build ios        # iOS (requires macOS + Xcode)
```

## Features

### Currently completed
✅ Navigation
✅ Structure
✅ Overall plan for the app
✅ Local data layer

### Future milestones include
- Medication CRUD
- Reminder scheduling
- Pill inventory tracking
- Refill notifications
- Settings implementation


## Tech Stack
- Flutter
- Dart
- Hive

## Why Medimind?

Medication schedules and inventory can be difficult to keep track off, especially during long-term treatments. Medimind takes the burden of remembering all that off the patient by combining reminders, prescription tracking and pill inventory monitoring into a single application
