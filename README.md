# Vlogger Flutter Project

A Flutter application for user management utilizing the BLoC pattern and clean code practices. The app integrates with DummyJSON API to fetch users, posts, and todos. Features include infinite scrolling, search functionality, and user detail screens.

## Features

- **User List Screen**: Displays users with avatar, name, and email.
- **Infinite Scrolling**: Implemented with pagination for a smooth user experience.
- **Search Bar**: Real-time search functionality to find users by their name.
- **User Detail Screen**: Displays user info along with their posts and todos.
- **Create Post Screen**: Allows users to add new posts locally with a title and body.
- **Loading Indicators**: Shows progress during API calls.
- **Error Handling**: Displays error messages appropriately in case of failures.

### Bonus Features (Optional)
- **Pull-to-refresh functionality**.
- **Offline caching with local storage**.
- **Light/Dark theme switching**.

## Setup

To get the project up and running on your local machine, follow these steps:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/vlogger.git
    ```

2. **Install dependencies**:

   Inside the project directory, run the following command to install the necessary dependencies:

    ```bash
    flutter pub get
    ```

3. **Generate code using build_runner**:

   To generate required files for data models (using `freezed`, `json_serializable`), run the following command:

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4. **Run the app**:

   To launch the app, use the following command:

    ```bash
    flutter run
    ```

   Ensure that you have an emulator running or a device connected to see the application.

## Architecture

This project follows a **clean architecture** with the following layers:

- **Data Layer**:
    - Handles API calls, response parsing, and mapping to entities.
    - Uses `retrofit` for network calls and generates data models via `freezed` and `json_serializable`.

- **Domain Layer**:
    - Contains business logic, use cases, and abstraction for repository interfaces.

- **Presentation Layer**:
    - Displays UI using BLoC (Business Logic Component) for state management.
    - Manages states like loading, success, and error with `flutter_bloc`.

- **Dependency Injection**:
    - Uses `get_it` and `injectable` to manage dependencies across the app.

## Dependencies

The project utilizes the following main dependencies:

- **State Management**:
    - `flutter_bloc`, `bloc` for managing app states.
- **Networking & API**:
    - `retrofit`, `dio` for HTTP requests and API interaction.
- **Data Models**:
    - `freezed_annotation`, `json_annotation`, `json_serializable` for generating immutable data classes and serialization.
- **UI & Utility**:
    - `flutter_bloc`: State management in the UI layer.
    - `cached_network_image`: For caching images efficiently.
    - `sliding_up_panel`: For a sliding panel UI feature.
    - `intl`: For internationalization (i18n) support.

## Testing

Unit and widget tests are implemented for the core business logic, BLoC events, and repository layer. Here’s how to run the tests:

1. **Run tests**:

    ```bash
    flutter test
    ```

2. **Testing BLoC**:
    - Unit tests are included for testing BLoC events and states.
    - Mock dependencies like API clients using `mockito` during testing.

## Folder Structure

- **lib/**: Contains all the Dart files for the app's core functionality and UI.
    - **core/**: Utility classes, constants, and custom exceptions.
    - **data/**: API-related models, repositories, and responses.
    - **features/**: Main functionality divided by features (user management, posts, todos).
    - **presentation/**: BLoC files and screens related to user interface.

- **test/**: Contains all test files for unit and widget tests.

## Code Quality & Best Practices

- **Clean Code**: Code is written following the clean code principles for easy readability and maintainability.
- **BLoC Pattern**: Proper use of the BLoC pattern for separating business logic from UI.
- **Error Handling**: Proper error handling with appropriate user feedback on failures.
- **API Response Handling**: Handles pagination, search functionality, and nested API data fetching for posts and todos.

## Contributing

If you’d like to contribute to this project:

1. **Fork the repository** on GitHub.
2. **Clone your fork** locally:

    ```bash
    git clone https://github.com/your-username/vlogger.git
    ```

3. **Create a new branch** for your feature:

    ```bash
    git checkout -b feature/your-feature
    ```

4. **Commit your changes**:

    ```bash
    git commit -m 'Add your feature'
    ```

5. **Push to your fork**:

    ```bash
    git push origin feature/your-feature
    ```

6. **Create a Pull Request** to the main repository.

## License

This project is licensed under the MIT License - see the [LICENSE] (LICENSE) file for details.

---

### Final Notes:
- **Versioning**: Ensure that the app version in `pubspec.yaml` is updated for each release.
- **Performance**: Consider implementing offline caching or pagination optimizations for performance.
- **Security**: If applicable, make sure any sensitive API keys or credentials are stored securely and not exposed in the codebase.

With this `README.md`, you now have a comprehensive guide for setting up, using, testing, and contributing to your Flutter project. This should also help developers understand the architecture and dependencies used in the project.
