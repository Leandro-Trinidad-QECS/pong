class Paddle {
  float x;
  float y;
  float h = 70;
  float w = 12;
  Paddle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y = constrain(y, 0+h/2, height-h/2);
  }
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}