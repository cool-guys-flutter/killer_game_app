# Killer Game App

This is a Flutter app for playing a killer game. It provides a user interface for different game pages, including a setup page, a main game page, a history page, a distribution page, and a finish page.

## Problem
Imagine 4 players: Timur, Arthur, Karina and Arina. If we play accroding to usual rules, the distribution may be the following:
- Arthur => Timur
- Timur => Arthur
- Karina => Arina
- Arina => Karina
In this case there is no absolute winner of the game.

## Pages

- Hello page to meet new users and explain the rules
- Main game page to play the game
- Setup page to configure the game settings
- Distribution page to distribute players during the game
- Finish page to end the game

## Features
- Local storage: we store data about user in local storage to recognize new 
- Network issues: we save the state of user for restart experience
- Unit and Widget tests to check the correctness of the program
- CI/CD piplines for building and deployment
- Animations: flip card in distribution page
- User can switch light and dark theme of the app
- We use riverpod provider in this project
- User can choose app language



## Plans
- History page to view the game history

## Getting Started

To get started with this app, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/killer-game-app.git`
2. Install dependencies: `flutter pub get`
3. Run the app: `flutter run`

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Authors
AKA team:
- Arthur Popov
- Karina Siniatullina
- Arina Zimina