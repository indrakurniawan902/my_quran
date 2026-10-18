# my_quran

A modern Quran mobile app built with Flutter, focusing on offline-first reading,
surah audio recitation, daily doa, and a strict Clean Architecture layout.

This codebase serves as the **reference implementation** for my personal Flutter
projects — the convention set in `dev/prayer-timev2` is what got canonized into
[flutter-cubit-template](https://github.com/indrakurniawan902/flutter-cubit-template).

## Features

- **Quran reader:** Surah list, per-ayat detail, and Arabic typography
- **Audio recitation:** streamed and cached audio playback via `audioplayers`
- **Doa collection:** daily supplications with categorization
- **Authentication:** optional Google Sign-In backed by Firebase Auth
- **Network inspector:** `chucker_flutter` for in-app HTTP inspection during dev

## Stack

- **Architecture:** Clean Architecture (`data → domain ← presentation`)
- **State management:** `flutter_bloc` (Cubit only, no events)
- **Dependency injection:** `get_it` + `injectable`
- **Networking:** `dio` + `pretty_dio_logger`
- **Local storage:** `hive` / `hive_flutter`
- **Error handling:** `dartz` (`Either<Failure, T>`)
- **Routing:** `go_router`
- **Services:** Firebase (Core, Auth, Analytics, Crashlytics)

## Requirements

- Flutter `^3.5.4` / Dart SDK
- JDK 17
