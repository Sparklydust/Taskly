# Taskly


## Overview

Taskly is an iOS to-do list application developed as an assessment test for Microoled. 

The application allows users to manage their tasks by adding, completing, and deleting them while ensuring persistent data storage. The project follows the **MVVM (Model-View-ViewModel)** architecture and is implemented using **Swift 6** and **SwiftUI**.


## Requirements

Develop a simple task management app with the following functionalities:

- **Task Creation**: Users can add new tasks.
- **Task Completion**: Tasks can be marked as completed or uncompleted.
- **Task Deletion**: Users can remove tasks from the list.
- **Task Sorting**: Uncompleted tasks appear at the top, while completed tasks appear at the bottom.
- **Data Persistence**: Tasks are stored locally on the device.

Additionally, unit tests were required for at least part of the application. A **bonus** was provided for implementing UI tests that simulate user interactions.


## Features

- **Task Management**: Create, complete, and delete tasks.
- **Sorting Logic**: Ensures uncompleted tasks stay at the top.
- **Persistence**: Uses **SwiftData** for local storage.
- **MVVM Architecture**: Ensures separation of concerns for better maintainability.
- **Design System**: Modularized SwiftUI components for a structured and scalable UI.
- **Localization**: Fully translated in English and French using **String Catalog**.
- **Accessibility**: VoiceOver support and structured UI elements for an inclusive experience.
- **Unit Testing**: Tests core logic functionalities.
- **UI Testing (Bonus)**: Simulates user interactions with task creation, completion, and deletion.


## Setup Instructions

1. Clone the repository.
2. Open the project in Xcode 16 or later.
3. Run the app on an iPhone simulator or a physical device running iOS 18 or later.


## Architecture

Taskly follows the **MVVM (Model-View-ViewModel)** pattern to ensure a clean separation of concerns.

- **Model**: Defines the data structure for tasks.
- **ViewModel**: Handles business logic and interacts with the model.
- **View**: SwiftUI components that reflect the state of the ViewModel.

This approach keeps the UI independent of the business logic, making the app easier to maintain and test.

Additionally, the **Design** folder contains reusable **SwiftUI Elements and Components**, structured to keep the views clean and modular while ensuring consistent UI implementation.


## Technical Choices & Rationale

### 1. SwiftData for Persistence
**Why?**  
- Chosen over **UserDefaults** for structured data storage.  
- Chosen over **Core Data** for its modern API and **automatic model generation**.  
- Enables **reactive updates** in SwiftUI with minimal boilerplate.  

*Limitation:* **Unit tests involving SwiftData are currently disabled** due to in-memory persistence issues in Xcode’s test environment (**Xcode 16.2 (16C5032a)**). Apple needs to address this known bug in a future release.

### 2. MVVM Architecture
**Why?**  
- Separates UI (View), business logic (ViewModel), and data (Model).  
- Enhances **testability** by isolating logic in ViewModels.  
- Improves **maintainability** as the project scales.

### 3. Design System with SwiftUI Components
**Why?**  
- **Reusable UI Elements** (buttons, text fields, cards) improve **code clarity**.  
- Reduces **redundant code** by centralizing common components.  
- Ensures **consistent styling** across the app.

### 4. Test Plans: `Develop` & `Interactions`
**Why?**  
- **Develop Test Plan** → Runs **unit tests** for sorting logic, persistence, and completion state updates.  
- **Interactions Test Plan** → Runs **UI tests** to verify user flows.  
- Helps **separate concerns**, making debugging and test execution more efficient.  
- **Perfectly fits with Xcode Cloud**, enabling automated test runs for both logic and UI interactions in a CI/CD pipeline.

### 5. Accessibility  
**Why?**  
- Accessibility was **not required**, but implemented as it is **crucial for an inclusive user experience**.  
- Ensures **usability for visually impaired users** by leveraging **VoiceOver** and proper accessibility traits.
- Enhances user experience by making task management **usable by a broader audience**.  

### 6. Localization  
**Why?**  
- Supports **English & French**, making the app accessible to a wider audience.  
- Uses **String Catalog** to simplify localization, offering a **centralized, scalable, and Xcode-native** approach.  
- **Reduces manual work** by consolidating translations in one place, improving maintainability.  
- Facilitates future expansion to additional languages with **minimal effort**.

### 7. Development Assets (`Doubles` Folder)
**Why?**  
- Ensures **test and preview data** do not get included in the production build.  
- Keeps the app **lightweight** while enabling robust **unit and UI testing**.


## Testing

The project includes:
- **Unit Tests** using **Swift Testing**, Apple's latest framework, to verify sorting logic, completion state updates, and task persistence.
- **UI Tests** (Bonus) using **XCUIApplication**, ensuring end-to-end testing of user interactions.

### Running Tests  
To execute the correct tests, follow these steps in Xcode:

1. Press **⌘ + 6** to open the test navigator on the left sidebar.
2. Select the appropriate **Test Plan**:
   - **`Develop`** → Runs **unit tests** for sorting logic, persistence, and completion state updates.
   - **`Interactions`** → Runs **UI tests** to verify user flows.
3. Press **⌘ + U** to run the selected tests.

This ensures that the correct set of tests is executed based on the validation focus.

## License

Taskly is available under the MIT license.


## Contact

For any questions, reach out to [roland.lariotte@gmail.com](mailto:roland.lariotte@gmail.com).
