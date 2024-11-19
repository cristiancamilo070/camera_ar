# Camera AR

[![Flutter Version](https://img.shields.io/badge/Flutter-3.10.5-blue?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/github/license/cristiancamilo070/camera_ar)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web-orange)](https://flutter.dev)
[![Last Commit](https://img.shields.io/github/last-commit/cristiancamilo070/camera_ar)](https://github.com/cristiancamilo070/camera_ar/commits/main)
[![Issues](https://img.shields.io/github/issues/cristiancamilo070/camera_ar)](https://github.com/cristiancamilo070/camera_ar/issues)
[![Stars](https://img.shields.io/github/stars/cristiancamilo070/camera_ar?style=social)](https://github.com/cristiancamilo070/camera_ar)

## Running the Flutter Project Locally

To run this Flutter project locally, follow these steps:

- Make sure you have Flutter and Dart installed on your machine.
- Clone the GitHub repository to your local machine using the following command:

```bash
git clone https://github.com/cristiancamilo070/camera_ar.git
```

- then run

```bash
flutter pub get
```

```bash
flutter run
```

# Frontend Overview

<div style="display: flex; justify-content: space-between;">
  <img src="assets/screenshots/1.jpg" alt="Screenshot 1" width="180" height="350">
  <img src="assets/screenshots/2.jpg" alt="Screenshot 2" width="180" height="350">
</div>
<div style="display: flex; justify-content: space-between;">
  <img src="assets/screenshots/3.jpg" alt="Screenshot 1" width="180" height="350">
  <img src="assets/screenshots/4.jpg" alt="Screenshot 2" width="180" height="350">
</div>
<div style="display: flex; justify-content: space-between;">
  <img src="assets/screenshots/5.jpg" alt="Screenshot 1" width="180" height="350">
  <img src="assets/screenshots/6.jpg" alt="Screenshot 2" width="180" height="350">
</div>
<div style="display: flex; justify-content: space-between;">
  <img src="assets/screenshots/7.jpg" alt="Screenshot 2" width="180" height="350">
 <img src="assets/screenshots/8.jpg" alt="Screenshot 2" width="180" height="350">
  >
</div>

## Clean Architecture and Code

This Flutter frontend follows the principles of Clean Architecture and Clean Code, providing a structured and maintainable codebase.

## User Functionality

    •	AR Plane Detection: The app uses ARCore to detect horizontal planes in the environment.
    •	3D Object Placement: Users can place a cube on a detected plane.
    •	Object Interaction: Users can interact with the cube, rotating it using buttons or moving it by tapping another area on the plane.
    •	Clean Architecture: The project is built following the principles of Clean Architecture, ensuring a modular and maintainable codebase.
    •	Test Coverage: Basic unit and widget tests have been implemented to validate core functionalities.

### Splash Screen

A Splash Screen is implemented to enhance the user experience by displaying a visual indication that the app is loading.
