# MyTexi

MyTexi is a Flutter-based taxi booking app that connects users with drivers. The app offers essential features like login, signup, ride requests, real-time tracking, and ride feedback.

## Features

1. **Login**
   - Secure login for both users and drivers.

2. **Signup**
   - New users and drivers can register with their details.

3. **Request Page**
   - Users can request a ride with details like pickup and drop-off locations.

4. **User Tracking**
   - Real-time tracking of the user's location during the ride.

5. **Dual User Roles**
   - Separate interfaces for Drivers and Users:
     - Users can request rides.
     - Drivers can view and accept ride requests.

6. **Ride Request Flow**
   - Users request a ride.
   - The request is shown to nearby drivers.
   - Drivers can accept the request.
   - The ride starts and tracks real-time progress.

7. **Ride Feedback**
   - After completing the ride, users can leave feedback about the ride experience.

8. **Ride Details**
   - Both drivers and users can view details of completed rides.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/mytexi.git
   ```

2. Navigate to the project directory:
   ```bash
   cd mytexi
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Folder Structure

```plaintext
mytexi/
├── lib/
│   ├── main.dart  # Main entry point of the app
│   ├── screens/   # Contains all UI screens
│   ├── models/    # Data models for the app
│   ├── services/  # Backend services and API integration
│   ├── widgets/   # Reusable UI components
├── assets/        # Images, fonts, and other static assets
├── pubspec.yaml   # Project dependencies and configuration
```

## Technologies Used

- **Flutter**: Frontend framework
- **Dart**: Programming language
- **Backend**: Choose your preferred backend solution (e.g., Node.js, Django, etc.)
- **Database**: Integrate your preferred database (e.g., MySQL, MongoDB, etc.)

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add feature name'`).
4. Push to the branch (`git push origin feature-name`).
5. Create a pull request.

