# Object-Oriented Tic-Tac-Toe

A command-line implementation of the classic Tic-Tac-Toe game, built with Ruby. This project focuses on **Object-Oriented Programming (OOP)** principles, separating logic into distinct classes for the Board, Players, and Game Flow.

## 🚀 Features

- **Robust OOP Architecture:** Logic is cleanly split into `Board`, `Player`, and `Game` classes.
- **Dynamic Board Rendering:** A clean, updating interface in your terminal.
- **Colorized Output:** Visual distinction between players (Blue vs. Yellow) and warnings (Red).
- **Hardened Input Validation:** Players have a maximum of **3 attempts** to choose a valid cell before forfeiting the match.
- **Smart Win Detection:** Utilizes coordinate mapping to detect rows, columns, and diagonals efficiently.

## 🛠️ Technologies Used

- **Ruby** (Logic and Game Engine)
- **Colorize Gem** (Terminal UI styling)
- **Rubocop Gem** (Code quality)

## 📦 Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone git@github.com:KAKZBI/tic-tac-toe.git
   cd tic-tac-toe

2. **Install Dependencies: Ensure you have Ruby installed and the colorize gem:**

Bash

gem install colorize

3. **Run the Game:**
Run the game using Bundler:
Bash

bundle exec ruby main.rb

🎮 How to Play
1. Enter the names for Player 1 and Player 2.

2. Players take turns choosing a number (1-9) corresponding to the board positions.

3. If a player enters an invalid number or an occupied cell 3 times, they automatically lose.

4. The first player to get three in a row wins!

📜 License
This project is open-source and available under the MIT License.