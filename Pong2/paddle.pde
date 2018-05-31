class Paddle {
  float x;
  float y;
  float h = 70;
  float w = 12;
  float easing = 0.05;

  Paddle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y = constrain(y, 0+h/2, height-h/2);
  }

  boolean hit() {
    if ( collision(int(x), int(y), int(w), int(h), int(ball.x), int(ball.y), int(ball.w), int(ball.w))) {
      return true;
    }
    return false;
  }
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}