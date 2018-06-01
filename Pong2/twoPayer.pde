void twoPlayer() {
  background(0);
  drawDivider();
  drawScore();
  paddleL.display();
  paddleR.display();
  paddleL.update();
  paddleR.update();
  ball.display();
  ball.update();
}
