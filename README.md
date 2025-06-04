# Custom DNS Flutter App

This Flutter project is a simple mobile app to simulate connecting to a custom private DNS hostname.

## Features
- Input field for custom DNS hostname (default: dns.adguard-dns.com)
- Connect button with simulated connection
- Confirmation message displayed on connection
- Dark and light mode support
- No external assets (icon drawn in Flutter code)

## Setup Signing (for release APK)

1. Generate keystore (see guide if you don't have one).
2. Create `android/key.properties` file (do NOT commit this file) with your keystore info:

```properties
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=myalias
storeFile=custom_dns.jks
```

3. Add your keystore file `custom_dns.jks` to the `android/` folder locally or upload it in your CI environment.
4. Use Codemagic or local build to generate signed APK.

## Build APK

To build a release APK:

```bash
flutter build apk --release
```

## License
MIT License