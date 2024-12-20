class MovingPlatform extends Platform {
  float speedX, speedY;

  MovingPlatform(float x, float y, float w, float h, float speedX, float speedY) {
    super(x, y, w, h);
    this.speedX = speedX;
    this.speedY = speedY;
  }

  void update() {
    // Save the current position
    float newX = x + speedX;
    float newY = y + speedY;

    // Check collision with static platforms
    boolean collisionX = false;
    boolean collisionY = false;

    for (Platform p : platforms) {
      if (p != this) { // Avoid self-collision
        if (checkCollision(newX, y, p)) {
          collisionX = true;
        }
        if (checkCollision(x, newY, p)) {
          collisionY = true;
        }
      }
    }

    // Reverse direction if a collision occurs
    if (collisionX) speedX *= -1;
    if (collisionY) speedY *= -1;

    // Update position if no collision
    if (!collisionX) x = newX;
    if (!collisionY) y = newY;

    // Reverse direction when hitting window bounds
    if (x <= 0 || x + w >= width) speedX *= -1;
    if (y <= 0 || y + h >= height) speedY *= -1;
  }

  @Override
  void display() {
    update();
    super.display();
  }

  // Check collision between this platform and another
  boolean checkCollision(float nextX, float nextY, Platform other) {
    return nextX < other.x + other.w &&
           nextX + w > other.x &&
           nextY < other.y + other.h &&
           nextY + h > other.y;
  }
}
