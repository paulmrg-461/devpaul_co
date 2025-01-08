# DevPaul Portfolio

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)

<a  href="https://drive.google.com/uc?export=view&id=1zOTywKProEcx7pJDRYFsu5agkbkv4Nuq" target="_blank"><img  src="https://drive.google.com/uc?export=view&id=1zOTywKProEcx7pJDRYFsu5agkbkv4Nuq"  style="width: 1200px; max-width: 100%; height: auto"  title="Click to enlarge picture" />

## Table of Contents

- [About](#about)
- [Features](#features)
- [Demo](#demo)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About

Welcome to **DevPaul Portfolio**! This is a responsive Flutter Web application designed to showcase my skills, projects, and experience as a full-stack developer. The portfolio includes interactive sections, a contact form, and a list of collaborators, providing a comprehensive overview of my professional journey.

## Features

- **Responsive Design:** Optimized for large, medium, and small screens ensuring a seamless experience across devices.
- **Interactive Contact Forms:** Three distinct contact views tailored for different screen sizes, all utilizing a reusable form component.
- **Collaborators Section:** Showcases team members with auto-scrolling functionality for an engaging display.
- **Localization Support:** Multilingual support to cater to a diverse audience.
- **Custom Animations:** Smooth animations enhancing user interaction.
- **SEO Optimized:** Proper meta tags and structured data for better search engine visibility.

## Demo

Check out the live demo of the DevPaul Portfolio [here](https://devpaul.pro).

![DevPaul Portfolio Demo](assets/screenshots/demo.gif)

## Getting Started

Follow these instructions to set up and run the project locally on your machine.

### Prerequisites

- **Flutter SDK:** Ensure you have Flutter installed. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
- **Dart SDK:** Included with Flutter.
- **Web Browser:** Latest version of Chrome, Firefox, or Edge for testing.

### Installation

1. **Clone the Repository**

   ```bash
     git clone https://github.com/your-username/devpaul_portfolio.git
   ```
2. **Navigate to the Project Directory**

   ```bash
     cd devpaul_portfolio
   ```
3. **Get Dependencies**

   ```bash
     flutter pub get
   ```
4. **Run the Application**

   ```bash
     flutter run -d chrome
   ```
   This command will launch the portfolio in your default web browser.

## Project Structure

```vbnet
devpaul_portfolio/
├── assets/
│   ├── images/
│   ├── icons/
│   └── screenshots/
├── lib/
│   ├── core/
│   │   └── validators/
│   ├── domain/
│   │   └── entities/
│   ├── presentation/
│   │   ├── providers/
│   │   ├── shared/
│   │   │   ├── widgets/
│   │   │   └── components/
│   │   └── views/
│   │       ├── contact_view_lg.dart
│   │       ├── contact_view_md.dart
│   │       └── contact_view_sm.dart
│   └── main.dart
├── test/
├── web/
│   └── index.html
├── pubspec.yaml
└── README.md
```
- assets/: Contains images, icons, and screenshots used in the application.
- lib/: Main source code of the application.
- core/validators/: Contains input validation logic.
- domain/entities/: Defines data models.
- presentation/: UI layer with providers, shared components, and views.
- providers/: State management providers.
- shared/: Reusable widgets and components.
- views/: Different views for large, medium, and small screens.
- web/: Web-specific configurations and assets.
- test/: Contains unit and widget tests.
- pubspec.yaml: Project dependencies and configurations.

## Technologies Used
- Flutter: UI toolkit for building natively compiled applications.
- Dart: Programming language optimized for UI.
- Google Fonts: For custom typography.
- url_launcher: To handle URL launching for the contact form.
- Flutter Localization: For multilingual support.

## Contributing
Contributions are welcome! Follow these steps to get started:

1. **Fork the Repository**

2. **Create a Feature Branch

   ```bash
     git checkout -b feature/YourFeatureName
   ```
3. **Commit Your Changes**

   ```bash
     git commit -m "Add some feature"
   ```
4. **Push to the Branch**

   ```bash
     git push origin feature/YourFeatureName
   ```
   This command will launch the portfolio in your default web browser.
5. **OPen a Pull Request**

## License
This project is licensed under the MIT License.

## Contact
Developed by:
Paul Realpe

Email: co.devpaul@gmail.com

Phone: 3148580454

<a  href="https://devpaul.co">https://devpaul.co/</a>

Feel free to reach out for any inquiries or collaborations!
