class Paddle {
  float x;
  float y;
  float w;
  float h;



  Paddle(float xx, float yy) {
    w = 10;
    h = 60;

    x = xx;
    y = yy;
  }

  void reset() {
  }

  void update() {
    y = constrain(y, 0+h/2, height-h/2);
  }
  void display() {
    pushMatrix();
    rectMode(CENTER);
    rect(x, y, w, h);
    popMatrix();
  }
}