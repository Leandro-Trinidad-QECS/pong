class Paddle {
  float x;
  float y;
  float w;
  float h;

  Paddle() {
    w = 10;
    h = 60;

    x = w*2;
    //y = 400/2;
    y = 400/2;
  }

  void update() {
  }
  void display() {
    pushMatrix();
    rectMode(CENTER);
    rect(x, y, w, h);
    popMatrix();
  }
}