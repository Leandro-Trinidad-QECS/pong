class Paddle {
  float x;
  float y;
  float w;
  float h;

  Paddle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void update() {
  }
  void display() {
    rectMode(CENTER);
    rect(x,y,w,h,50);
  }
}