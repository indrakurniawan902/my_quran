# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Firebase & Google Play Services
# Since you have firebase_crashlytics, firebase_core, auth, and google_sign_in
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-dontwarn com.google.firebase.**

# Audio Players, Geolocator, etc (preventing plugin native code from being stripped too aggressively)
-keep class com.baseflow.** { *; }

# Suppress warnings for missing references in flutter plugins
-dontwarn io.flutter.**
