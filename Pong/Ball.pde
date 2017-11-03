class Ball {
  float x = 600/2;
  float y = 400/2;
  float w = 15;

  float angle = random(-PI/4, PI/4);
  float deltaX = 10 * cos(angle);
  float deltaY = 10 * sin(angle);
  float speed = 10;

  void reset() {
    x = 600/2;
    y = 400/2;
    angle = random(-PI/4, PI/4);
    deltaX = speed * cos(angle);
    deltaY = speed * sin(angle);
    if (random(1) < 0.5) {
      deltaX *= -1;
    }
  }
  void update() {
    y += deltaY;
    x += deltaX;

    if (y < 0 || y > height) {
      deltaY *= -1;
    }
    if (x < 0 || x > width) {
      reset();
    }

    if (collision(int(paddleL.x), int(paddleL.y), int(paddleL.w), int(paddleL.h), int(x), int(y), int(w))) {
      if (x > paddleL.x) {
        float diff = y - (paddleL.y - paddleL.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, paddleL.h, -rad, rad);
        deltaX = speed * cos(angle);
        deltaY = speed * sin(angle);
        x = paddleL.x + paddleL.w/2 + w;
      }
    }
    if (collision(int(paddleAI.x), int(paddleAI.y), int(paddleAI.w), int(paddleAI.h), int(x), int(y), int(w))) {
       if (x < paddleAI.x) {
        //xspeed *= -1;
        float diff = y - (paddleAI.y - paddleAI.h/2);
        float angle = map(diff, 0, paddleAI.h, radians(225), radians(135));
        deltaX = speed * cos(angle);
        deltaY = speed * sin(angle);
        x = paddleAI.x - paddleAI.w/2 - w;
      }
    }
  }
  void display() {
    pushMatrix();
    fill(#3FDE38);
    ellipseMode(CENTER);
    rect(x, y, w, w);
    popMatrix();
  }
}