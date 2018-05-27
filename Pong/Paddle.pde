class Paddle {
  float x;
  float y;
  float w;
  float h;



  Paddle(float x, float y) {
    this.w = 10;
    this.h = 60;

    this.x = x;
    this.y = y;
  }

  void reset() {
  }


  void update() {

    //keeps the paddle in the screen
    y = constrain(y, 0+h/2, height-h/2);
  }
  void display() {
    pushMatrix();
    rectMode(CENTER);
    rect(x, y, w, h);
    popMatrix();
  }
}
