class Ball {
  float x = width/2;
  float y = height/2;
  float w = 15;

  float angle = random(-PI/4, PI/4);
  float speed = 5;
  float deltaX = speed * cos(angle);
  float deltaY = speed * sin(angle);

  void update() {
    y += deltaY;
    x += deltaX;

    // roof bounce
    if (y < 0 || y > height) {
      deltaY *= -1;
    }
    if (x > width || x < 0) {
      reset();
    }
    if (paddleL.hit()) {
      deltaX *= -1;
    } else if (paddleR.hit()) { 
      deltaX *= -1;
    }
  }

  void reset() {
    x = 600/2;
    y = 400/2;
    w = 15;

    angle = random(-PI/4, PI/4);
    speed = 5;
    deltaX = speed * cos(angle);
    deltaY = speed * sin(angle);
  }
  void display() {
    pushMatrix();
    fill(255);
    ellipseMode(CENTER);
    rect(x, y, w, w);
    popMatrix();
    
  }
}