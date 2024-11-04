# PHP Music Application 🎶
Welcome to the PHP Music Application! This project is designed as a web-based platform where users can explore and play music, manage their accounts, and organize playlists. It combines robust backend features with a clean, user-friendly interface, supported by DevOps tools for efficient and high-quality deployment.

## Project Overview
The PHP Music Application allows users to:

Browse and play songs with an intuitive audio player.
Manage personal accounts with authentication and session handling.
Create and manage playlists to customize their music experience.
Receive email notifications for account activities (integrated with PHPMailer).
## Technologies Used
* Development Stack
PHP: The core backend language used to handle business logic and interact with the database.
MySQL: Manages user data, playlist info, and song metadata.
HTML/CSS/JavaScript: Power the frontend for an engaging and responsive user experience.
DevOps and Automation Stack
This project emphasizes not only development but also deployment automation and code quality assurance:

* Docker: Containerized the application to standardize the environment, making the deployment more portable and consistent across systems. Docker enables you to run the application locally in an isolated environment, reducing dependency conflicts.

* Jenkins: Configured a CI/CD pipeline to automate the build and deployment process. With Jenkins, the application is built, tested, and deployed to ensure smooth updates and consistent version control.

* SonarQube: Integrated for code quality analysis, helping to maintain clean, efficient, and secure code. SonarQube checks for code smells, bugs, and security vulnerabilities, promoting best practices in development.

## Project Structure

css/: Contains stylesheets for a polished user interface.
database/: Database configurations and schema for MySQL.
images/: Image assets for a visually rich experience.
js/: JavaScript files to enhance interactivity.
phpmailer/: Library for managing email notifications.
songs/: Directory for the song files accessible within the application.
webfonts/: Fonts for consistent typography and branding.

## Project Highlights
1. Docker for Containerization 🐳
The application is fully containerized using Docker, encapsulating the PHP application along with its dependencies, ensuring it runs the same way in different environments. This simplifies the deployment process and mitigates “it works on my machine” issues.

2. Jenkins CI/CD Pipeline 🔄
Automated Jenkins pipelines are set up to streamline the build, test, and deployment cycle. Whenever code is pushed, Jenkins triggers a series of steps to:

Build the Docker image.
Run unit tests and SonarQube analysis for code quality.
Deploy the application if tests pass successfully.
This automation enables faster delivery and consistent quality, helping to catch issues early and keep the application running smoothly.

3. SonarQube Code Quality Integration ✅
The project integrates SonarQube for continuous code quality analysis. This helps:

Detect potential bugs and vulnerabilities.
Improve maintainability by identifying code smells.
Promote clean code practices by setting quality gates before deployment.
By maintaining high code quality, this application remains secure, efficient, and scalable.
