// Import Library That responsible for Sounds
import ddf.minim.*;

//---------------------- Audio objects ----------------------
Minim minim;
AudioPlayer coinSound;
AudioPlayer failSound;
AudioPlayer winLevelSound;
AudioPlayer winGameSound;
AudioPlayer bgMusic;

//---------------------- Game objects ----------------------
ArrayList<Platform> platforms;
ArrayList<Spikes> spikes;
ArrayList<Coin> coins;
Player player;

//---------------------- Global Variables ----------------------
float cameraX = 0;
int currentLevel = 1;
int gameState = 0;   // 0 = Main Menu, 1 = Game, 2 = Instructions, 3 = Developers
Button startButton, instructionButton, developerButton, returnButton;
PFont font; // For custom font



void setup() {
  size(800, 600);
  font = createFont("Arial", 12, true); // Load Font

  // ---------------------- Initialize buttons ----------------------
  startButton = new Button(width / 2 - 60, 180, 180, 120, "Start");
  instructionButton = new Button(width / 2 - 60, 320, 180, 120, "Instructions");
  developerButton = new Button(width / 2 - 60, 460, 180, 120, "Developers");
  returnButton = new Button(10, 2, 70, 30, "Return");

  // ---------------------- Load sounds ----------------------
  minim = new Minim(this);
  coinSound = minim.loadFile("\\Sounds\\Coin.mp3"); // Replace with your sound file
  bgMusic = minim.loadFile("\\Sounds\\background.mp3"); // Replace with your sound file
  bgMusic.loop();
  size(800, 600);

  loadLevel(level1); //Load Level
}

void draw() {
  background(135, 206, 235);

  // ---------------------- Game States Handeling ----------------------
  switch (gameState) {
  case 0: // Main Menu
    drawMainMenu();
    break;
  case 1: // Game
    drawGame();
    break;
  case 2: // Instructions
    drawInstructions();
    break;
  case 3: // Developers
    drawDevelopers();
    break;
  }
}

// ---------------------- Define Methods for Handeling Keyboard and mouse ----------------------
void keyReleased() {
  if (keyCode == RIGHT || keyCode == LEFT) {
    player.speedX = 0;
  }
}

void keyPressed() {
  if (keyCode == RIGHT) player.move(1);
  if (keyCode == LEFT) player.move(-1);
  if (keyCode == UP) player.jump();
}
void mousePressed() {
  if (gameState == 0) {
    if (startButton.isHovered()) gameState = 1;
    if (instructionButton.isHovered()) gameState = 2;
    if (developerButton.isHovered()) gameState = 3;
  } else {
    if (returnButton.isHovered()) gameState = 0;
  }
}

// ---------------------- Main menu screen ----------------------
void drawMainMenu() {
  fill(0);
  textAlign(CENTER);
  textFont(font, 30);
  text("Money Collector Game", width / 2, 100);

  startButton.display();
  instructionButton.display();
  developerButton.display();
}

// ---------------------- Game screen ----------------------
void drawGame() {
  background(135, 206, 235);

  // Camera translation for game world
  translate(-cameraX, 0);

  // Draw game elements
  for (Platform p : platforms) p.display();
  for (MovingPlatform mp : movingPlatforms) mp.display();
  for (Spikes s : spikes) {
    s.display();
    if (s.checkCollision(player)) resetPlayer();
  }
  for (MovingSpikes ms : movingSpikes) {
    ms.update();
    ms.display();
    if (ms.checkCollision(player)) resetPlayer();
  }
  for (RotatingCoin rc : rotatingCoins) {
    rc.display();
    if (rc.checkCollision(player)) player.score++;
  }

  for (Coin c : coins) {
    c.display();
    if (c.checkCollision(player)) player.score++;
  }

  // Player updates
  player.display();
  player.update();
  int levelWidth = level1[0].length() * 20; // Total level width
  cameraX = constrain(player.x - width / 2, 0, max(levelWidth - width, 0));

  // Draw HUD (fixed to screen)
  pushMatrix();
  translate(cameraX, 0); // Match camera translation for fixed elements
  drawHUD();
  popMatrix();

  // Check for level completion
  checkLevelCompletion();
}

// Instructions screen
void drawInstructions() {
  fill(0);
  textAlign(LEFT);
  textFont(font, 20);
  text("Instructions:\n\nUse the arrow keys to move:\n- UP to jump\n- LEFT to move left\n- RIGHT to move right\n\nCollect coins to increase your score.\nAvoid spikes to prevent restarting.", 50, 100);
  returnButton.display();
}

// Developers screen
void drawDevelopers() {
  fill(0);
  textAlign(CENTER);
  textFont(font, 26);
  text("Game Developer:\n\n- Developer 1: [Abdelrahman Salah]  ", width / 2, 200);
  returnButton.display();
}

// HUD (Score and Return Button)
void drawHUD() {
  // Draw Score
  fill(0);
  textSize(30);
  text("Score: " + player.score +"/30", 170, 13 );

  // Display return button
  if (gameState == 1 || gameState == 2 || gameState == 3) {
    returnButton.display();
  }
}

// Display message with a delay
void showMessage(String message1, String message2) {
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text(message1, cameraX + width / 2, height / 2 - 20);
  delay(1000);
  text(message2, cameraX + width / 2, height / 2 + 20);
  delay(2000);
}

// Check for level completion
void checkLevelCompletion() {
  if (player.score == 30) {//coins.size()
    if (currentLevel == 1) {
      showMessage("You Complete Level 1!", "Loading Level 2...");
      currentLevel = 2;
      loadLevel(level2);
    } else {
      showMessage("You Win!", "Congratulations!");
      noLoop();
    }
  }
}
