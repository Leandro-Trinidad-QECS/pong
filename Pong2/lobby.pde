

void lobby() {
  background(0);
  textFont(JustMyType90);
  textAlign(CENTER, CENTER);
  //drawScore();
  textAlign(CENTER, CENTER);
  fill(255);
  text("PONG", width/2, 100);
  ball.display();
  ball.update();
  paddleL.display();
  paddleL.update();
  aiMoveLeftPaddle();
  paddleR.display();
  paddleR.update();
  aiMoveRightPaddle();
  textBox();
}


void aiMoveLeftPaddle() {
  if (ball.x < width/2) {
    float targetY = ball.y;
    float dy = targetY - paddleL.y;
    paddleL.y += dy * paddleL.easing;
  } else {
    float targetY = height/2;
    float dy = targetY - paddleL.y;
    paddleL.y += dy * paddleL.easing;
  }
}

void aiMoveRightPaddle() {
  if (ball.x > width/2) {
    float targetY = ball.y;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  } else {
    float targetY = height/2;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  }
}
void textBox() {
  textFont(JustMyType90);
  textSize(50);
  noStroke();
  fill(255);
  if (pointRect(mouseX, mouseY, width/2, height/2-50, 160, 80)) {
    if (mousePressed) {
      gameScreen = 1;
    }
    fill(255);
    rect(width/2, height/2-50, 160, 80);
    fill(0);
  }
  text("One Player", width/2, height/2-50);


  fill(255);
  if (pointRect(mouseX, mouseY, width/2, height/2+50, 160, 80)) {
    if (mousePressed) {
      gameScreen = 2;
    }
    fill(255);
    rect(width/2, height/2+50, 160, 80);
    fill(0);
  }
  text("Two Player", width/2, height/2+50);
}
void drawScore() {
  fill(255);
  textFont(JustMyType90);
  textAlign(RIGHT);
  text(scoreLeft, width/2-100, 100);
  textAlign(LEFT);
  text(scoreRight, width/2+100, 100);
}

void resetScore() {
  scoreLeft = 0;
  scoreRight = 0;
}
boolean pointRect(int px, int py, int rx, int ry, int rw, int rh) {

  // test for collision
  if (px >= rx-rw/2 && px <= rx+rw/2 && py >= ry-rh/2 && py <= ry+rh/2) {
    return true;    // if a hit, return true
  } else {            // if not, return false
    return false;
  }
}