
// Player class
class Player {
  float x, y, speedX, speedY, GRAVITY = 0.4;
  boolean inAir = true;
  int SIZE = 20;
  boolean invertedGravity = false;
  int score = 0;

  Player(float x, float y) {
    this.x = x;
    this.y = y;
    speedX = 0;
    speedY = 0;
  }
   void invertGravity() {
    GRAVITY = -GRAVITY;
    invertedGravity = true;
  }

void display() {
  fill(0);
  rect(x, y, SIZE, SIZE); // Main square
  
  // White circle in the center
  fill(255);
  ellipse(x + SIZE / 2, y + SIZE / 2, SIZE / 2, SIZE / 2);

  // Moving dot
  float dotX = x + SIZE / 2;
  float dotY = y + SIZE / 2;

  if (keyPressed) {
    if (keyCode == RIGHT) dotX += SIZE / 4;
    if (keyCode == LEFT) dotX -= SIZE / 4;
    if (keyCode == UP) dotY -= SIZE / 4;
    if (keyCode == DOWN) dotY += SIZE / 4;
  }

  fill(0);
  ellipse(dotX, dotY, 5, 5); // Small black dot
}


void update() {
  // Gravity
  if (inAir) {
    speedY += GRAVITY;
  }
  y += speedY;

  // Vertical collision detection
boolean grounded = false;
for (Platform p : platforms) {
  if (y + SIZE <= p.y && y + SIZE + speedY >= p.y && x + SIZE > p.x && x < p.x + p.w) {
    y = p.y - SIZE;
    speedY = 0;
    grounded = true;
    break;
  }
  if (y >= p.y + p.h && y + speedY <= p.y + p.h && x + SIZE > p.x && x < p.x + p.w) {
    y = p.y + p.h;
    speedY = 0;
    break;
  }
}
for (MovingPlatform mp : movingPlatforms) {
  if (y + SIZE <= mp.y && y + SIZE + speedY >= mp.y && x + SIZE > mp.x && x < mp.x + mp.w) {
    y = mp.y - SIZE;
    speedY = 0;
    grounded = true;
    break;
  }
  if (y >= mp.y + mp.h && y + speedY <= mp.y + mp.h && x + SIZE > mp.x && x < mp.x + mp.w) {
    y = mp.y + mp.h;
    speedY = 0;
    break;
  }
}
inAir = !grounded;

  // Horizontal movement and collision
  x += speedX;
  for (Platform p : platforms) {
    if (x + SIZE > p.x && x < p.x + p.w && y + SIZE > p.y && y < p.y + p.h) {
      if (speedX > 0) {
        x = p.x - SIZE; // Stop moving right
      } else if (speedX < 0) {
        x = p.x + p.w; // Stop moving left
      }
    }
  }
    for (MovingPlatform mp : movingPlatforms) {
    if (x + SIZE > mp.x && x < mp.x + mp.w && y + SIZE > mp.y && y < mp.y + mp.h) {
      if (speedX > 0) {
        x = mp.x - SIZE; // Stop moving right
      } else if (speedX < 0) {
        x = mp.x + mp.w; // Stop moving left
      }
    }
  }
}



  void move(int dir) {
    speedX = dir * 5;
  }

  void jump() {
    if (!inAir) {
      speedY = -10;
      inAir = true;
    }
  }
}
