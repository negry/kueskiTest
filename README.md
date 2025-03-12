# KueskiMovies

## Requirements
- Xcode 16+
- Swift 5+
- iOS 16+

## Overview
KueskiMovies is an iOS application built using SwiftUI. The project follows a modular architecture with a clean separation of concerns, ensuring scalability and maintainability.

## Project Structure
The project is structured into multiple layers:

### **1. Presentation Layer**
This layer contains everything related to the UI:
- **Views**: SwiftUI views for displaying UI components.
- **ViewModels**: Handles UI logic and interacts with the domain layer.
- **Components**: Reusable UI elements.

### **2. Domain Layer**
The core business logic resides here:
- **Models**: Data structures representing business entities.
- **Repositories**: Interfaces defining data access behavior.

### **3. Helpers Layer**
This layer contains extensions and utilities that facilitate common operations:
- **Extensions**: Helper extensions for various Swift types.
- **Modifiers**: Custom SwiftUI modifiers for styling and behaviors.

### **4. Utilities Layer**
This layer handles caching, localization, and networking:
- **CacheManager**: A generic cache implementation with different caching behaviors (`sourceOnly`, `firstAvailable`, `cacheOnly`).
- **Localizable**: A localization manager to handle multilingual support efficiently.
- **Networking**: Handles API requests and data fetching using URLSession.

### **5. Support Files**
Miscellaneous project configurations, including environment variables, xcconfig files, and assets.

## Features
- **Movie List**: Displays a list of movies with pagination.
- **Movie Details**: Shows details for a selected movie, including title, genres, overview, and release date.
- **Infinite Scrolling**: Loads more movies when reaching the bottom of the list.
- **Caching Mechanism**: Stores API responses to reduce network calls and improve performance.
- **Localization**: Supports multiple languages with a structured approach.

## Getting Started
1. Clone the repository.
2. Open the project in Xcode 16+.
3. Run the project on an iOS Simulator or a physical device.

## License
This project is open-source and available under the MIT License.


