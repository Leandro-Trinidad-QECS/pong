class Ball {
  float x = width/2;
  float y = height/2;
  float w = 15;

  float angle = random(-PI/4, PI/4);
  float speed = 10;
  float deltaX = speed * cos(angle);
  float deltaY = speed * sin(angle);
  int prevScore;
  Ball() {
    reset();
  }
  void update() {
    y += deltaY;
    x += deltaX;

    // roof bounce
    if (y < 0 || y > height) {
      hitSM.play();
      deltaY *= -1;
    }
    if (x > width) {
      explosionSM.play();
      prevScore = 2;
      scoreLeft +=1;
      reset();
    } else if (x < 0) {
      explosionSM.play();
      prevScore = 1;
      scoreRight +=1;
      reset();
    }
    if (paddleL.hit()) {
      hitSM.play();
      checkPaddleLeft(paddleL);
    } else if (paddleR.hit()) { 
      hitSM.play();
      checkPaddleRight(paddleR);
    }
  }

  void checkPaddleLeft(Paddle p) {
    if (y - w < p.y + p.h/2 && y + w > p.y - p.h/2 && x - w < p.x + p.w/2) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        deltaX = 5 * cos(angle);
        deltaY = 5 * sin(angle);
        x = p.x + p.w/2 + w;
        //xspeed *= -1;
      }
    }
  }
  void checkPaddleRight(Paddle p) {
    if (y - w < p.y + p.h/2 && y + w > p.y - p.h/2 && x + w > p.x - p.w/2) {
      if (x < p.x) {
        //xspeed *= -1;
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        deltaX = 5 * cos(angle);
        deltaY = 5 * sin(angle);
        x = p.x - p.w/2 - w;
      }
    }
  }

  void reset() {
    x = width/2;
    y = height/2;
    w = 15;
    //print("test:", prevScore, ":");
    if (scoreLeft == 0 && scoreRight == 0) {
      if (random(1) < 0.5) {
        deltaX *= -1;
      }
    }  

    angle = random(-PI/4, PI/4);
    speed = 5;
    deltaX = speed * cos(angle);
    deltaY = speed * sin(angle);
  }

  void display() {
    pushMatrix();

    ellipseMode(CENTER);
    fill(255-100);
    rect(x-3, y+3, w, w);
    fill(255);
    rect(x, y, w, w);
    popMatrix();
  }
}
