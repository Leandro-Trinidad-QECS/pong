void twoPlayer() {
  surface.setTitle("Pong | 2 Players");
  background(0);
  pauseButton();

  if (!paused) {
    drawDivider();
    drawScore();
    paddleL.display();
    paddleR.display();
    paddleL.update();
    paddleR.update();
    ball.display();
    ball.update();
  }
}
