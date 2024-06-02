# Documentation for Priority Soft's Flutter Developer Test Project

## Introduction

This document provides an overview of the development process, assumptions, challenges, and additional features implemented for the Priority Soft's Flutter Developer Test Project. The project aims to build a mobile application for both Android and iOS platforms using Flutter, following the provided Figma design. The application integrates with Firebase for data storage.

## Project Setup Instructions

### Prerequisites
- Install Flutter SDK: Follow the official Flutter installation guide to set up the Flutter environment on your machine.

- Set up an emulator or physical device for testing: Configure either an Android or iOS emulator through Android Studio or Xcode, or connect a physical device for testing. Personally, I used the physical device which is Android for this testing. 

- Create a Firebase project: Go to the Firebase console, create a new project, and enable the required services (Firestore, Storage, Functions, etc.). Then, I used the Firebase CLI to connect the firebase project with this flutter project.

### Development Environment
- Use Visual Studio Code or another IDE of choice with Flutter and Dart plugins installed. I used the VS Code IDE for this project.

- Ensure your IDE is configured to recognize Flutter commands and hot reload/restart capabilities.

### Folder Structure
The project follows a standard Flutter project structure with separate directories for models, views, controllers, and utilities. This structure promotes modularity and maintainability. Here is the breakdown of the folder structure.
- bloc: Contains the BLOC file of every logic used throughout this app.
- core: Contains the core files used in this app. It is furhter divided into several folders.
    - app: Contains the constants which is used in the app such as colors, icons, images, text and text styles, etc. Moreover, it also contains the theme configuration of this app.
    - configs: Contains the api url.
    - enums: Contains the enum values.
    - functions: Contains the global functions.
    - handler: Contains the Base API Client which stores the main functions such as fetch, push, etc.
    - providers: Contains the bloc providers.
    - routes: Contains the route, route navigator as well as route generator.
    - services: Contains the services file such as firebase service.
    - utils: Contains the utility files for the easiness of features in app.
- data: Contains the data classes of the app. It further divides into:
    - data_providers: Containes the api clients to handle the api requests.
    - models: Contains the model classes.
    - repositories: Contains the repository of the each ui classes.
- di_injection: Contains the dependency injection of the classes. One file is to register the objects and another to access it.
- ui: Contains the views of the app. It contains:
    - screens: Contains the UI.
    - widgets: Contains the global widgest used throughout the app.

## Assumptions Made During Development

- It was assumed that the Figma design provided a comprehensive layout for all pages and components. Any missing details were inferred based on common practices in mobile app design.

- I have created the database which holds five shoes, each of different brands, which are displayed in the Discover screen in App. As, it is time consuming and really not require any programmitical skills to have more data, so I have add only one shoe which has all the details according to the Figma design. That's why, users will be directed to the same shoe, no matter which shoe is clicked.


## Challenges Faced and Solutions

### Challenge 1: Computing Average Review Scores
- Problem: I tried to implement the Firebase function for this feature. But there is a payment system to use the 'Functions' feature of Firebase. Currently, I do not hold any Credit card which can be used to access that feature. (Nepal's Credit card does not work)

- Solution: I have instead computed the average review scores in the Frontend that is in Flutter. It is done by calculating the total sum of the ratings of the users then divided by the total sum of the reviews done.

### Challenge 2: Ensuring Responsiveness Across Devices
Solution: Implemented responsive design techniques such as media queries, and made breakpoints to differentiate between tab and mobile.

### Challenge 3: Sorting options include gender, and color.
- Problem: It is more like a confused question instead of problem. The doc asked me to implement 'Sorting options include most recent, lowest price, highest reviews, gender, and color'. I have implemented the sorting options for recent, lowest price and highest reviews but not for gender and color.

- Solution: As far as I have known, having the filter option for gender and color works better rather than sorting.

## Additional Features or Improvements
- I have implemented the Dark Mode in UI. As a default value, It is left on the system preference. So, you have to switch your mobile theme to light mode to see the light mode design as per the provided figma file.