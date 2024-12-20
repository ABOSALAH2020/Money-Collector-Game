// Coin class
class Coin {
  float x, y;
  boolean collected = false;

  Coin(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    if (!collected) {
      fill(255, 223, 0);
      ellipse(x + 10, y + 10, 15, 15);
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
