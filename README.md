# PostDetails VIPER Application

## Overview
This repository contains an iOS application that demonstrates the implementation of the **VIPER architecture**. The app includes two main features: a **Posts List** and a **Post Details** screen. It highlights the use of caching, animations, and multi-scheme configurations while adhering to clean architecture principles.

The project emphasizes testability, modular design, and a seamless user experience.

---

## Features
- **Posts List Screen**:
  - Displays a list of posts fetched from a data source (e.g., local cache or API).
  - Efficient rendering and smooth scrolling.

- **Post Details Screen**:
  - Shows the title and description of a selected post.
  - Includes a "Like" button with a smooth animation and state persistence (like/dislike).

- **Caching**:
  - Implements data caching for faster loading and offline support.
  - Uses `UserDefaults` for lightweight storage.

- **VIPER Architecture**:
  - Fully decoupled components for scalability and maintainability.

- **Interactive UI**:
  - Engaging animations for button interactions.
  - Auto Layout ensures a responsive design across devices.

- **Unit Testing**:
  - Comprehensive test cases for VIPER components such as Router, Presenter, and View.

- **Multi-Scheme Setup**:
  - Supports separate schemes for **Debug** and **Release** configurations.

---

## Architecture: VIPER

### VIPER Layers
1. **View**
   - Displays UI elements and delegates user interactions to the Presenter.
   - Uses `PostListViewProtocol` and `PostDetailsViewProtocol` to communicate with the Presenter.

2. **Interactor**
   - Manages business logic and state.
   - Handles caching and prepares data for the Presenter.

3. **Presenter**
   - Acts as a mediator between View and Router.
   - Handles user actions and prepares data for the View.

4. **Router**
   - Manages navigation and screen transitions.
   - Provides static methods to create and initialize VIPER modules.

5. **Entity**
   - Defines data models such as `Post`. These are simple `structs` conforming to `Codable` and `Equatable`.

---

## Folder Structure
```
PostDetailsVIPERApp/
├── Entities/
│   ├── Post.swift
├── Modules/
│   ├── PostList/
│   │   ├── PostListInteractor.swift
│   │   ├── PostListPresenter.swift
│   │   ├── PostListRouter.swift
│   │   ├── PostListViewController.swift
│   │   ├── Protocols/
│   │       ├── PostListViewProtocol.swift
│   │       ├── PostListPresenterProtocol.swift
│   └── PostDetails/
│       ├── PostDetailsInteractor.swift
│       ├── PostDetailsPresenter.swift
│       ├── PostDetailsRouter.swift
│       ├── PostDetailsViewController.swift
│       ├── Protocols/
│           ├── PostDetailsViewProtocol.swift
│           ├── PostDetailsPresenterProtocol.swift
├── Tests/
│   ├── PostListTests/
│   │   ├── PostListRouterTests.swift
│   │   ├── PostListPresenterTests.swift
│   └── PostDetailsTests/
│       ├── PostDetailsRouterTests.swift
│       ├── PostDetailsPresenterTests.swift
│       ├── PostDetailsViewTests.swift
├── Resources/
│   ├── Assets.xcassets
│   ├── Info.plist
```

---

## Unit Testing
The app includes robust unit tests to validate VIPER components:

- **Router Tests**:
  - Ensures proper module creation and wiring of View, Presenter, and Router.

- **Presenter Tests**:
  - Verifies that user interactions trigger the expected methods on the View.
  - Checks the correct state handling for the "Like" button.

- **View Tests**:
  - Tests the UI layout and state updates (mocking presenter dependencies).

---

## Multi-Scheme Configuration

### Available Schemes
1. **Debug**:
   - Used for development and testing.
   - Includes additional debug logs and mock configurations.

2. **Release**:
   - Optimized for performance and minimal logging.

### Workflow
1. **Module Creation**: Use the Router's static `createModule` methods to instantiate modules (`PostList` or `PostDetails`) with required dependencies.
2. **Interaction Flow**:
   - The user navigates from the Post List screen to the Post Details screen.
   - The Post Details screen includes a "Like" button with animations and state management.

---

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/PostDetailsVIPERApp.git
   ```
2. Open the project in Xcode:
   ```bash
   open PostDetailsVIPERApp.xcodeproj
   ```
3. Build and run the app on a simulator or device.

---

## Screenshots

### Posts List Screen
| ![Posts List](https://via.placeholder.com/400x800) |

### Post Details Screen
| ![Post Details](https://via.placeholder.com/400x800) |

---

## Requirements
- **iOS 14.0+**
- **Xcode 14.0+**
- **Swift 5.0+**

---

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed description of the changes.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgements
- Inspiration: Demonstrating VIPER architecture for scalable and testable iOS applications.
- Tools Used: Xcode, XCTest, SwiftLint.

Feel free to reach out with questions or suggestions!
