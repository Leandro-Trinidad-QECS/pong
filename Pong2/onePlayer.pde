void onePlayer() {
  background(0);
  drawScore();
  drawDivider();
  paddleL.display();
  paddleR.display();
  paddleL.update();

  if (ball.x > width/2) {
    float targetY = ball.y;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  } else {
    float targetY = height/2;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  }
  paddleR.update();

  ball.display();
  ball.update();
}
