class Spikes {
  float x, y, w, h;
  char type; // '^' for upward spikes, 'V' for downward spikes

  Spikes(float x, float y, float w, float h, char type) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = type;
  }

  void display() {
    fill(255, 0, 0); // Red spikes
    if (type == '^') {
      // Upward spike
      triangle(x, y + h, x + w / 2, y, x + w, y + h);
    } else if (type == 'V') {
      // Downward spike
      triangle(x, y, x + w / 2, y + h, x + w, y);
    }
  }

  boolean checkCollision(Player p) {
    if (type == '^') {
      return (p.x + p.SIZE > x && p.x < x + w && p.y + p.SIZE > y && p.y < y + h);
    } else if (type == 'V') {
      return (p.x + p.SIZE > x && p.x < x + w && p.y > y && p.y < y + h);
    }
    return false;
  }
}
