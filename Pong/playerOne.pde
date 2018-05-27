void PlayerOne() {
  //draw the board
  background(0);
  drawLine();
  pushMatrix();
  textAlign(RIGHT);
  textSize(90);
  text(scoreLeft, width/2-100, 100);
  textAlign(LEFT);
  text(scoreRight, width/2+100, 100);
  popMatrix();

  paddleL.display();
  paddleR.display();
  if (keyPressed) {
    if ( key == CODED) {
      if (keyCode == UP) {
        paddleL.y-=5;
      }
      if (keyCode == DOWN) {
        paddleL.y+=5;
      }
    }
    paddleL.update();
  }
}
