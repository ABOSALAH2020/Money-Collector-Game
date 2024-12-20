class RotatingCoin {
  float x, y, angle = 0;
  boolean collected = false;

  RotatingCoin(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    if (!collected) {
      pushMatrix();
      translate(x + 10, y + 10);
      rotate(angle);
      fill(255, 223, 0);
      ellipse(0, 0, 15, 15); // Coin base
      fill(200, 200, 0);
      rect(-3, -3, 6, 6); // Simple rotating detail
      popMatrix();
      angle += 0.05; // Adjust rotation speed as needed
    }
  }

  boolean checkCollision(Player p) {
    if (!collected && dist(p.x + p.SIZE / 2, p.y + p.SIZE / 2, x + 10, y + 10) < 15) {
      collected = true;
      coinSound.rewind();
      coinSound.play();
      return true;
    }
    return false;
  }
}
