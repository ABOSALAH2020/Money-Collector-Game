class MovingSpikes {
  float x, y, w, h;
  float startY; // Starting Y position
  float amplitude; // Maximum movement distance
  char type;
  float speed; // Movement speed
  boolean movingUp; // Direction of movement

  MovingSpikes(float x, float y, float w, float h, float amplitude, float speed, boolean startsUp, char type) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = type;
    this.startY = y;
    this.amplitude = amplitude;
    this.speed = speed;
    this.movingUp = startsUp;
  }

  void update() {
    if (movingUp) {
      y -= speed;
      if (y < startY - amplitude) movingUp = false;
    } else {
      y += speed;
      if (y > startY + amplitude) movingUp = true;
    }
  }

  void display() {
    fill(255, 0, 0); // Red spikes
    if (type == '+') {
      // Upward spike
      triangle(x, y + h, x + w / 2, y, x + w, y + h);
    } else if (type == '!') {
      // Downward spike
      triangle(x, y, x + w / 2, y + h, x + w, y);
    }
  }

  boolean checkCollision(Player p) {
    if (type == '+') {
      return (p.x + p.SIZE > x && p.x < x + w && p.y + p.SIZE > y && p.y < y + h);
    } else if (type == '!') {
      return (p.x + p.SIZE > x && p.x < x + w && p.y > y && p.y < y + h);
    }
    return false;
  }
}
