# Money Collector Game
## Overview
**Money Collector Game** is a simple 2D platformer game where players collect coins while avoiding spikes. The game features multiple levels, rotating coins, moving spikes, and a vertical scrolling mechanic.
This project was inspired by [Skydron](https://openprocessing.org/sketch/2219220), an incredible game that influenced many of the mechanics and ideas used in this project.

![Game Screenshot](data/Game1.png)

---

## Features
- **Platforming mechanics**: Jump, move left and right, and navigate through challenging levels.
- **Dynamic spikes**: Moving spikes add an extra layer of difficulty.
- **Rotating coins**: Collect coins to increase your score.
- **Level transitions**: Complete levels to unlock new challenges.
- **Sound effects and music**: background music and sound effects for actions.

---

## Game Elements
1. **Player Character**
   - Black square with white center circle
   - Controlled using arrow keys
   - Dynamic movement with gravity physics
2. **Platforms**
   - Static platforms (gray blocks)
   - Moving platforms (horizontal/vertical movement)
3. **Collectibles**
   - Regular coins (yellow circles)
   - Rotating coins (animated yellow coins with center detail)
4. **Obstacles**
   - Static spikes (red triangles)
   - Moving spikes (red triangles with vertical movement)

---

## How to Play
1. Use the arrow keys to control the player:
   - **UP**: Jump.
   - **LEFT**: Move left.
   - **RIGHT**: Move right.
2. Avoid spikes and collect coins to increase your score.
3. Complete all coins in a level to unlock the next one.

---

## Game Screens
### Main Menu
The main menu provides options to:
- Start the game.
- View instructions.
- Learn about the developers.

## Gameplay
#### The player navigates through platforms, collects coins, and avoids spikes.
---

## Instructions for Developers
### Prerequisites
- Download and install [Processing 3](https://processing.org/).
- The game assets (sounds) are in the Processing Sketch folder.

### How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/ABOSALAH2020/Money-Collector-Game
2. **Install Processing 3:** Download and install from the official website.
3. **Install Minim Library:** Use Processing's Library Manager to install Minim.
4. **Organize Files:** Ensure all `.pde` files and sound files are in the correct directories.
5. **Run the Game:** Open the main `.pde` file in Processing and click the run button.
   
---
## Files Structure 
- **Button.pde:** Handles button creation and interactions in the menu.
- **Coins.pde:** Manages the logic for coins, including collision and collection.
- **Levels.pde:** Defines level layouts.
- **loadLevel.pde:** Loads level data into the game, including platforms, coins, and obstacles.
- **Main.pde:** The main game file. Handles initialization, game states, and core logic.
- **movingPlatform.pde:** Implements logic for platforms that move dynamically.
- **movingSpikes.pde:** Handles spikes that move as obstacles.
- **Platform.pde:** Implements static platform structures.
- **Player.pde:** Defines the player's properties and movement mechanics.
- **Reset.pde:** Manages player resets upon collision or falling.
- **RotatingCoin.pde:** Adds behavior for spinning coins.
- **pikes.pde:** Handles stationary spike obstacles.
---
##  Level Design Explanation
In this game, levels are designed using a grid-like structure defined as a String[], where each character in the grid represents a specific game element. This makes it easy to visualize and create levels as text art. Below, each character's meaning and corresponding behavior in the game is explained.

## Key to Level Design Characters
| Character | Element | Description |
|  :---:       |     :---:      |       :---   |
| `O`    | Static Platform     | Represents a solid, immovable platform the player can walk on.    |
| `_`     | Empty Space       | Represents open air where the player can move freely or fall through.      |
| `*`      | 	Static Coin       | A collectible coin that rewards the player with points upon collision.|
| `#`   | 	Rotating Coin     | A collectible coin that spins, making it more visually engaging.|
| `@`     | Player Spawn Point       | Indicates where the player starts in the level.|
| `~`   | Moving Platform    | A platform that moves horizontally or vertically, depending on predefined logic.    |
| `^`     | 	Stationary Spike (Up)       | An obstacle that damages the player if touched. Positioned pointing upward.      |
| `V`  |	Stationary Spike (Down)          | An obstacle that damages the player if touched. Positioned pointing downward.|
| `+`    | Moving Spike (Up/Down)       | A spike that moves vertically. It damages the player if touched.     |
| `!`   | 	Moving Spike (Down/Up)    | Similar to `+`, but follows a reversed movement pattern.    |

## Level Layout Example
#### Level 1 Explanation

```processing
String[] level1 = {                                                                                      
  "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
  "O_________________________V__***__V_______________________VVV______________VVVVVVV____________________O",
  "O__________________**____________________________**___________________________________________________O",
  "O***_____________OOOOOO_________________________OOOO__________________________________________________O",
  "OOOOO___________________________________________OOOO__________________________________________________O",
  "OVVVV____*_^^_*______________^^___*___^_________OOOO___________________*_____________________*^_______O",
  "O_______OOOOOOOO_________OOOOOOOOOOOOOOOOO______VVVV__________________OO____________________OOO_______O",
  "O________________________O_________________*________OOO______*****________OOOOOO____*O________________O",
  "O_____________________________OOOOOOOOOOOOOO__________OOOOOOOOOOOO^^^^^^^^^^^^OOOOOOOO^^^^^^^^^^______O",
  "O_________________OOO_________OOOOOOOOOOOOOO*_____________OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO______O",
  "O******__^^___________________OOOOOOOOOOOOOOO______________VVV_________VVVVVV___________VVVVVVVV______O",
  "OOOOOOOOOOOOOOO______O__O_____VVVVVVVVVVVVVV__________________________________________________________O",
  "O______________OO_______________________________*_____________________________________________________O",
  "O________________^^^^___**_____________________OOO__________________OO____________________________**__O",
  "O________________OOOOOOOOOO_________________________________________OO_______*_^________________OOOOOOO",
  "O^^**_______@________________________________________*______________________OOOO____________________VVO",
  "OOOOOO______________________________________________OOO_____________________OOOO_____**_______________O",
  "O_____________________________OO______*___________*_______*_^^_*_____________________OOOOOO___________O",
  "O_____________________________________O___________O______OOOOOOOO______________________________OO_____O",
  "O**_______OOOOOO______________________O___________O______________OOO_________OO_______________________O",
  "OOOOO______________________***________O^^^^^^^^^^^O_____________________________________**____________O",
  "O_______________________OOOOOOOO______OOOOOOOOOOOOO_________________OOOO____________OOOOOOO___________O",
  "O____________*****____________________VVVVVVVVVVVVV__________O^_____________________OOOOOOO_________**O",
  "O_______OOOOOOOOOOOOO________________________________________OO__________________________VV_______OOOOO",
  "O_______OOOOOOOOOOOOO________________________________________________________***______________________O",
  "O****___OOOOOOOOOOOOO_______________________________________________________OOOOO_____________________O",
  "O****___OOOOOOOOOOOOO^^^^^^^^^^^^^^___*************_____*_^_*_____*_^_*_____VVVVV______________^^_____O",
  "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
  "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
};
```
- Platforms `(O)`: Platforms are distributed throughout the level to provide a path for the player to navigate.
- Spikes `(^ and V)`: Stationary spikes create hazards that the player must avoid by jumping or timing movements.
- Coins `(*)`: Coins are placed in areas that encourage exploration and add extra challenges.
- Player Spawn `(@)`: The player starts near the bottom-left corner of the level.
- Moving Platforms `(~)`: Moving platforms help the player cross gaps that static platforms cannot cover.

## How to Develop New Levels
1. Start with a Base Layout: Begin by creating a rectangular level grid with empty spaces `(_)` and platforms `(O)` as the base.
2. Place Hazards and Collectibles:
   - Use `*` and `#` to add coins and rotating coins in interesting or hard-to-reach areas.
   - Add spikes `(^, V, +, !)` to increase difficulty and create areas requiring precise timing.
3. Add Dynamic Elements:
   - Incorporate moving platforms `(~)` to create puzzle-like challenges.
   - Add moving spikes `(+, !)` for dynamic hazards.
4. Test the Level:
   - Play the level to ensure it is challenging but fair.
   - Adjust the placement of collectibles and hazards for better balance.
  
---

## Signs and Symbols for Development
- `case` Logic: Each `case` in the `switch` statement adds an element based on the character in the grid. Modify or add cases to introduce new mechanics. For example:
   - To add a new enemy type, you could define `case 'E'`: and create an `Enemy` class.
- Coordinate System: The grid's X and Y coordinates correspond to the row and column indices of the `String[]`. Each element is positioned based on its grid location.


---
# Code Structure
## Main Game Loop
### Main.pde
- **Imports:** Uses the Minim library for audio.
- **Global Variables:** Manages game state, audio, and game objects.
- **Setup Function:** Initializes the game window, loads sounds, and sets up the main menu.
- **Draw Function:** Main game loop handling different game states (menu, game, instructions, developers).

## Player Mechanics
### Player.pde
- **Attributes:** Position, speed, gravity, and score.
- **Methods:**
   - `update()`: Handles movement and collision.
   - `display()`: Renders the player.
   - `move(int dir)`: Controls horizontal movement.
   - `jump()`: Implements jumping.
  
## Platforms
### Platform.pde
- **Attributes:** Position and size.
- **Methods:**
   - `display()`: Renders the platform.
     
### MovingPlatform.pde
- **Attributes:** Inherits from Platform with additional speed attributes.
- **Methods:**
   - `update()`: Handles movement and collision.
   - `display()`: Renders the moving platform.
 
## Collectibles
### Coin.pde
- **Attributes:** Position and collection status.
- **Methods:**
   - `display()`: Renders the coin.
   - `checkCollision(Player p)`: Checks if the player collects the coin.
  
### RotatingCoin.pde
- **Attributes:** Position, angle, and collection status.
- **Methods:**
   - `display()`: Renders the rotating coin.
   - `checkCollision(Player p)`: Checks if the player collects the rotating coin.
     
## Obstacles
### Spikes.pde
- **Attributes:** Position, size, and type (upward or downward).
- **Methods:**
   - `display()`: Renders the spikes.
   - `checkCollision(Player p)`: Checks if the player hits the spikes.
  
### MovingSpikes.pde
- **Attributes:** Position, movement amplitude, speed, and direction.
- **Methods:**
   - `update()`: Handles movement.
   - `display()`: Renders the moving spikes.
   - `checkCollision(Player p)`: Checks if the player hits the moving spikes.
     
## Level Design
### Levels.pde
- **Level Arrays:** Define the layout using characters for different elements (e.g., `O` for platforms, `*` for coins).
  
### LoadLevel.pde
- **loadLevel(String[] level):** Parses level arrays to create game objects.
  
## User Interface
### Button.pde
- **Attributes:** Position, size, and label.
- **Methods:**
   - `display()`: Renders the button.
   - `isHovered()`: Checks if the mouse is over the button.
  
## Audio
- **Initialization:** Loads and plays background music and sound effects.
- **Sound Effects:** Triggered on coin collection and level completion.
   
---
# Code Explanation 

## 1. Main Game Structure
###   - Main.pde
```processing 
// Core game variables and initialization
import ddf.minim.*;  // Audio library import

// Audio Components
Minim minim;
AudioPlayer coinSound, failSound, winLevelSound, winGameSound, bgMusic;

// Game Objects
ArrayList<Platform> platforms;
ArrayList<Spikes> spikes;
ArrayList<Coin> coins;
Player player;

// Game State Variables
float cameraX = 0;
int currentLevel = 1;
int gameState = 0;   // Game states: 0=Menu, 1=Game, 2=Instructions, 3=Developers
```

###    - Key Functions

```processing
void setup() {
    // Initializes game components, loads sounds, creates buttons
}

void draw() {
    // Main game loop handling different game states
}

void drawGame() {
    // Handles main gameplay rendering and logic
}

void checkLevelCompletion() {
    // Monitors game progress and level transitions
}
```
## 2. Player System
###    - Player.pde

```processing
class Player {
    // Player properties
    float x, y, speedX, speedY;
    float GRAVITY = 0.4;
    boolean inAir = true;
    int SIZE = 20;
    int score = 0;
```
###    - Key Methods:
```processing
void update() {
    // Handles physics and collision detection
}

void display() {
    // Renders player character with dynamic visual feedback
}

void move(int dir) {
    // Controls horizontal movement
}

void jump() {
    // Implements jumping mechanics
}
```

## 3. Platform Systems
###   - Platform.pde
```processing
class Platform {
    float x, y, w, h;
    
    void display() {
        // Basic platform rendering
    }
}
```
###   - MovingPlatform.pde
```processing
class MovingPlatform extends Platform {
    float speedX, speedY;
    
    void update() {
        // Handles platform movement and collision
    }
}
```

## 4. Collectible System
###    - Coin.pde
```processing
class Coin {
    float x, y;
    boolean collected = false;
    
    void display() {
        // Renders basic coin
    }
    
    boolean checkCollision(Player p) {
        // Handles coin collection
    }
}
```

###    - RotatingCoin.pde
```processing
class RotatingCoin {
    float x, y, angle = 0;
    
    void display() {
        // Renders animated rotating coin
    }
}
```

## 5. Obstacle System
###    - Spikes.pde
```processing
class Spikes {
    float x, y, w, h;
    char type; // '^' or 'V'
    
    void display() {
        // Renders spike obstacles
    }
    
    boolean checkCollision(Player p) {
        // Handles spike collision detection
    }
}
```

###    - MovingSpikes.pde
```processing
class MovingSpikes {
    float startY, amplitude, speed;
    boolean movingUp;
    
    void update() {
        // Controls spike movement patterns
    }
}
```

## 6. Level System
###    - Levels.pde
```processing
String[] level1 = {
    // Level layout using character mapping
    // O = Platform
    // * = Coin
    // ^ = Upward Spike
    // V = Downward Spike
    // @ = Player Start
    // etc.
};
```

###    - LoadLevel.pde
```processing
void loadLevel(String[] level) {
    // Converts level string array into game objects
    // Initializes platforms, coins, spikes, etc.
}
```

## 7. UI System
###    - Button.pde
```processing
class Button {
    float x, y, w, h;
    String label;
    
    void display() {
        // Renders interactive buttons
    }
    
    boolean isHovered() {
        // Checks mouse interaction
    }
}
```
