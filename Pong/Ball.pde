class Ball {
  float x = 600/2;
  float y = 400/2;
  float w = 15;
  float xx = 600/2;
  float yy = 400/2;
  float ww = 15;


  float ballloc;
  float angle = random(-PI/4, PI/4);
  float speed = 5;
  float deltaX = speed * cos(angle);
  float deltaY = speed * sin(angle);

  int randSpeed;
  int ballThrow;
  int scoreLeft;
  int scoreRight;

  boolean AIHit;
  void update() {
    y += deltaY;
    x += deltaX;

    // roof bounce
    if (y < 0 || y > height) {
      deltaY *= -1;
    }
    if (x<0 || x> width) {
      deltaX *= -1;
    }
  }

  void left(float paddY, float paddX, float paddH, float paddW) {
    float diff = y - (paddY - paddH/2);
    float rad = radians(45);
    float angle = map(diff, 0, paddH, -rad, rad);
    deltaX = speed * cos(angle);
    deltaY = speed * sin(angle);
    x = paddX + paddw/2 + w;
  }
}
void right() {
  float diff = y - (paddleAI.y - paddleAI.h/2);
  float angle = map(diff, 0, paddleAI.h, radians(225), radians(135));
  deltaX = speed * cos(angle);
  deltaY = speed * sin(angle);
  x = paddleAI.x - paddleAI.w/2 - w;
  AIHit = true;
}
void display() {
  pushMatrix();
  fill(#3FDE38);
  ellipseMode(CENTER);
  rect(x, y, w, w);
  popMatrix();
}
}
