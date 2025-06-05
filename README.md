# Vlogger Flutter Project

A Flutter application for user management utilizing the BLoC pattern and clean code practices. The app integrates with DummyJSON API to fetch users, posts, and todos. Features include infinite scrolling, search functionality, and user detail screens.

## Features
- User List Screen with avatar, name, and email
- Infinite scrolling with real-time search
- Fetch and display user posts and todos
- Create Post Screen for adding new posts locally
- Error handling and loading indicators

## Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/def-Siddharth-Mishra/vlogger.git
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```
4. Generate code for Retrofit and Freezed:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

## Architecture

The project follows a clean architecture with the following structure:
- **Data Layer**: Handles API calls, response parsing, and mapping to entities.
- **Domain Layer**: Contains business logic and use cases.
- **Presentation Layer**: Displays UI using BLoC for state management.

## Dependencies
- `flutter_bloc`: State management with BLoC pattern
- `retrofit`: API client generation
- `get_it` & `injectable`: Dependency injection
- `freezed`: Immutable data classes

## Testing

Unit tests are available for BLoC and repository layers.

To run tests:

```bash
flutter test
