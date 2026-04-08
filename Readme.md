# Tic‑Tac‑Toe – terminal showdown

This is my second take on Tic‑Tac‑Toe.  
The first version (three years ago) was a procedural script wearing a class disguise. Everything was tangled together—the file reading, the user input, the game rules, and the saving mechanism.  
This one actually has a `Board`, `Player`, and `Game` – and it doesn’t make my eyes bleed.

**Watch a demo:**  
[![asciicast](https://asciinema.org/a/85Feto2ogrDbM8d7.svg)](https://asciinema.org/a/85Feto2ogrDbM8d7)

---

## What this is

Two players take turns placing X and O on a 3×3 grid.  
First to three in a row wins. If the board fills up, it’s a draw.  
Each player has 3 attempts to pick a valid cell – after that, the other player wins automatically.  
(Yes, that’s a bit harsh. I might change it after I learn testing.)

---

## What I wanted to learn

- How to split a game into `Board`, `Player`, and `Game` classes  
- Using constants for win conditions instead of copy‑paste `if` chains  
- Basic input validation with retry limits  
- Coloured terminal output with the `colorize` gem  

---

## How to run it

```bash
git clone https://github.com/yourusername/tic-tac-toe
cd tic-tac-toe
bundle install
ruby main.rb
```
## What still nags me
- The board is a hash where keys equal values initially – clever but weird. An array would be simpler.

- Invalid moves give the win to the other player after 3 failed attempts. Feels punishing.

- The player swapping logic in Game#run works but is hard to read.

- display_board gets called twice after every move – not a bug, just redundant.

But I’m calling it done. I’d rather build something new than polish this forever.

## How it compares to my old version
| Old (2022)                        | New (2025)                      |
|-----------------------------------|---------------------------------|
| One big Game class doing everything|Separate Board, Player, Game    |
|Hardcoded win conditions (8 if statements)|	WINNING_COMBOS constant with loops|
|No input retry – just infinite loops|3 attempts per player|
|No colours	|Colourised with colorize|
|Procedural playGame function|Clean main.rb that calls Game.new.run|

## Credits

- Colours: colorize gem

- Inspiration: The Odin Project and past me, who wrote terrible code so current me could write mediocre code

## License
MIT – use it, break it, make it better.