

void lobby() {
  background(0);
  textFont(JustMyType90);
  textAlign(CENTER);
  drawScore();
  //text("PONG",width/2,100);
  ball.display();
  ball.update();
  paddleL.display();
  paddleL.update();
  paddleR.display();
  paddleR.update();
  score();
}


void aiMoveLeftPaddle() {
}

void score() {
  if (ball.score() == 0) {
    scoreRight += 1;
    ball.reset();
  } else if (ball.score() == 1) {
    scoreLeft += 1;
    ball.reset();
  }
}
void drawScore() {
  fill(255);
  textFont(JustMyType90);
  textAlign(RIGHT);
  text(scoreLeft, width/2-100, 100);
  textAlign(LEFT);
  text(scoreRight, width/2+100, 100);
}
