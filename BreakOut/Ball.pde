class Ball {
  float x;
  float y;
  float w = 10;

  void update() {
  }
  void display() {
    ellipseMode(CENTER);
    ellipse(x, y, w, w);
  }
}