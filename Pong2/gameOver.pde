void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(90);
  textFont(JustMyType90);
  text("Game Over", width/2, 100);

  fill(255);
  if (pointRect(mouseX, mouseY, width/2, height/2, 145, 50)) {
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 145, 50);
    fill(0);
  }


  textSize(50);
  textFont(JustMyType50);

  text("Rematch", width/2, height/2);

  fill(255);
  if (pointRect(mouseX, mouseY, width/2, height/2+60, 145, 50)) {
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2+60, 145, 50);
    fill(0);
  }

  text("Exit", width/2, height/2+60);
}
