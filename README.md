# Marco DalCanto's Game Development Portfolio 2026

## FishFinders

### Game Overview
An object oriented game in which the player uses a mouse-guided player character to catch fish (via net projectiles), rack up points, and prevent fish from reaching the bottom of the screen. The player (A diver gif) uses nets to catch fish. The Timer class is used to cue the fish and powerups at (ir)regular intervals. There are three types of powerups: One that boots speed (the amount of lag between mouse movement and player movement is reduced), one that increases the maximum amount of ammo the player can hold (which recharges automatically), and one that heals the player.

### How to Run
Built with Processing.
Processing version: 4.0.1
Main sketch and project folder: FishFinders.pde
Required libraries: 
processing.sound.*
gifAnimation.*

The source code can be dowloaded at the bottom of this page. Install the required libraries in the documents folder of your computer, and then open the FishFinders.pde

### Controls

The space button starts the game from off the start-screen, and the left-mouse button fires nets.



### Three Power-Up Types
1. Health — Displayed by a red box with a white plus symbol on it, this powerup completely refills the player's health. (Has a 25% chance of spawning)
2. Movement — This looks like the bottom of the player's legs, their boost-boots, and decreases the easing between mouse movement and player movement, increasing mobilitiy. 
3. Ammo boost — Shown by a small net-looking object, this powerup increases the maximum number of nets that can be reached through the auto-reload feature.

### Gameplay examples:

![Gameplay](https://github.com/MarcoD-byte/Game-dev1/blob/main/images/fishfinders.png?raw=true)


![GameOverScreen](https://github.com/MarcoD-byte/Game-dev1/blob/main/images/gameover.png?raw=true)


## FishFinders source code
[Link for Source Code](https://github.com/MarcoD-byte/Game-dev1/tree/main/src/FishFinders)
