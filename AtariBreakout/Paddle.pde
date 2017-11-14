class Paddle {
  float x;
  float y;
  float w = 100;
  float h = 10;

  Paddle(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {


    x = constrain(x, 0+w/2, width-w/2);
  }
  void display() {
    rectMode(CENTER);
    rect(x, y, w, h,50);
  }
}