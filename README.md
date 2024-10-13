# 🎌 Anime Companion App

A Flutter application designed to be your go-to companion for all things anime! This app allows users to view detailed anime information, track new releases, and receive notifications about upcoming episodes.

## 🛠️ Technologies

- **Flutter**
- **Dart**

## ✨ Features

- Browse detailed information about various anime titles.
- View lists of new releases, top-rated, and popular anime.
- Check release dates for upcoming episodes.
- Receive notifications for new episodes.
- User-friendly interface for seamless navigation.

## 🚦 Running the Project

To run the project locally, follow these steps:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/anime-companion.git
    cd anime-companion
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Run the app**:

    ```bash
    flutter run
    ```

## 📦 Project Structure

```bash
lib/
├── service/
│   └── local_auth.dart    # Service for handling biometric authentication
├── widgets/
│   ├── button.dart        # Custom button widget
│   ├── icon_button.dart   # Custom icon button widget
│   └── textfield.dart     # Custom text field widget
├── auth.dart              # Authentication logic
└── main.dart              # Entry point of the application
└── pubspec.yaml           # Project configuration and dependencies
```

### 🔐 How It Works

The app uses a public anime API to fetch details about various anime series. Users can explore new releases, popular titles, and detailed episode information.

1. Home Page: Displays new releases and popular anime with easy navigation.
2. Anime Details: Provides in-depth information about selected anime, including synopsis, genres,   ratings, and episode listings.
3. Notification Feature: Users can enable notifications for their favorite anime, receiving alerts when new episodes are released.

### 📲 Enabling Notifications

To enable notifications for new episodes:
```
1. Allow notification permissions when prompted.
2. Go to the settings in the app to manage notification preferences.
```

## 🎥 Photos
<div>
  <img src="assets/images/1.jpg" alt="Image 1" width="200" height="450" style="display: inline-block; margin-right: 10px;"/>
  <img src="assets/images/2.jpg" alt="Image 2" width="200" height="450" style="display: inline-block;"/>
  <img src="assets/images/3.jpg" alt="Image 1" width="200" height="450" style="display: inline-block; margin-right: 10px;"/>
  <img src="assets/images/4.jpg" alt="Image 2" width="200" height="450" style="display: inline-block;"/>
</div>
