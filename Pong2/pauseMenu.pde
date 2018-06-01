void pauseMenu() {
  textFont(JustMyType90);
  textAlign(CENTER, CENTER);
  fill(255);
  rectMode(CENTER);
  rect(width/2,height/2,200,85);
  fill(255-100);
  text("Paused", width/2-3, height/2+3);
  fill(0);
  text("Paused", width/2, height/2);
}