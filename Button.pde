class Button {
  float x, y, w, h;
  String label;

  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }

  void display() {
    fill(isHovered() ? color(200, 200, 255) : color(255));
    stroke(0);
    rect(x, y, w, h, 10);
    fill(0);
    textAlign(CENTER, CENTER);
    textFont(font, 20);
    text(label, x + w / 2, y + h / 2);
  }

  boolean isHovered() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
