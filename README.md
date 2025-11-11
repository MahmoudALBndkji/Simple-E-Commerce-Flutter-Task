# Simple E‑Commerce Flutter Task

A lightweight E‑Commerce sample built with Flutter. The project follows a feature‑first structure and uses `flutter_bloc` for state management. Key screens/features include authentication, product listing, cart, and splash.

## Demo Video
https://github.com/user-attachments/assets/7e57c602-047c-41cd-a8e0-6a7322c3e5e1

## Authentication Credentials
For quick testing in the demo environment:

```text
Username: "donero"
Password: "ewedon"
```

Note: These are demo-only credentials and should not be used in production.

## Try the App From Drive (APK Build)
[![Get from Drive](https://img.shields.io/badge/Get%20from%20Drive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)](https://drive.google.com/drive/folders/1brmQqNy-F0NjI9qvqnMOuULJZRvjWqsj?usp=sharing)

## Overview
This repository demonstrates a clean, maintainable structure for a small e‑commerce app with:
- Predictable state management via `flutter_bloc`
- Feature‑first organization under `lib/features`
- Localized assets support (EN/AR)
- Example flows: login, product browsing, and cart management

## Getting Started
1) Ensure you have Flutter installed and set up
2) Install dependencies:
```bash
flutter pub get
```
3) Run the app:
```bash
flutter run
```


## Project Structure
```
lib
├── core/                         # Core utilities, constants, helpers, and shared widgets
│   └── utils/
│
├── features/
│   ├── auth/                     # Login flows, widgets
│   ├── cart/                     # Cart state & UI
│   ├── splash/                   # Splash/intro
│   └── ...                       # (e.g., products) feature(s)
│
├── main.dart                     # App entry
└── my_app.dart                   # Root app/widget setup
```

## Core Libraries
This project uses the following key packages (see `pubspec.yaml` for all):
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): State management
- [http](https://pub.dev/packages/http): Networking
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage): Secure local storage
- [skeletonizer](https://pub.dev/packages/skeletonizer): Skeleton loading UIs
- [quickalert](https://pub.dev/packages/quickalert): Quick in-app alerts
- [image_picker](https://pub.dev/packages/image_picker): Media picker
