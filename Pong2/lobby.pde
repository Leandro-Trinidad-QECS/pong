

void lobby() {

  /********* Setup lobby *********/
  background(0);
  textFont(JustMyType90);
  //drawScore();
  textAlign(CENTER, CENTER);
  //drawScore();
  textAlign(CENTER, CENTER);
  fill(255-100);
  text("PONG", width/2-3, 100+3);
  fill(255);
  text("PONG", width/2, 100);

  /********* Balls and Paddles *********/
  ball.display();
  ball.update();
  paddleL.display();
  paddleL.update();


  /********* Moving the left paddle *********/
  if (ball.x < width/2) {
    float targetY = ball.y;
    float dy = targetY - paddleL.y;
    paddleL.y += dy * paddleL.easing;
  } else {
    float targetY = height/2;
    float dy = targetY - paddleL.y;
    paddleL.y += dy * paddleL.easing;
  }


  paddleR.display();
  paddleR.update();


  /********* moving right paddle *********/
  if (ball.x > width/2) {
    float targetY = ball.y;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  } else {
    float targetY = height/2;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  }

  /********* buttons *********/
  textFont(JustMyType50);
  fill(255);
  if (pointRect(mouseX, mouseY, width/2, height/2-50, 160, 80)) {
    if (mousePressed) {
      resetScore();
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
      resetScore();
      gameScreen = 2;
    }
    fill(255);
    rect(width/2, height/2+50, 160, 80);
    fill(0);
  }
  text("Two Player", width/2, height/2+50);
}


void drawScore() {
  textFont(JustMyType90);
  textAlign(RIGHT);
  fill(255-100);
  text(scoreLeft, width/2-100-3, 100+3);
  fill(255);
  text(scoreLeft, width/2-100, 100);

  textAlign(LEFT);
  fill(255-100);
  text(scoreRight, width/2+100-3, 100+3);
  fill(255);
  text(scoreRight, width/2+100, 100);
}

void resetScore() {
  ball.reset();
  scoreLeft = 0;
  scoreRight = 0;
  paddleL.reset();
  paddleR.reset();
}
