PFont JustMyType90;
PFont JustMyType40;
Paddle paddleL;
Paddle paddleR;
textBox onePlayer;
textBox twoPlayer;
Ball ball = new Ball();
Ball ball2 = new Ball();
int control;
int scoreLeft = 0;
int scoreRight = 0;
int level = 0;
void setup() {
  JustMyType90 = loadFont("JustMyType-90.vlw");
  JustMyType40 = loadFont("JustMyType-40.vlw");
  size(858, 525, P2D);
  paddleL = new Paddle(20, height/2);
  paddleR = new Paddle(width-20, height/2);
  onePlayer = new textBox(width/2, height/2-50, 200, 50, color(255, 255, 255));
  twoPlayer = new textBox(width/2, height/2+50, 200, 50, color(255, 255, 255));
  smooth();
}
void draw() {
  textFont(JustMyType90);
  switch(level) {
  case 0:
    lobby();
    return;
  case 1:
    PlayerOne();
    return;
  case 2:
    PlayerTwo();
    return;
  }
}
void drawLine() {

  for (int i=10; i < height; i+= 10*2) {

    pushMatrix();
    fill(255);
    rectMode(CENTER);
    noStroke();
    rect(width/2, i, 5, 10);
    popMatrix();
  }
}
void lobby() {

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
  fill(255);
  paddleL.display();
  paddleR.display();

  pushMatrix();
  rectMode(CENTER);
  textFont(JustMyType40);
  onePlayer.display("ONE PLAYER", 40, color(0, 0, 0));
  twoPlayer.display("TWO PLAYER", 40, color(0, 0, 0));
  if (onePlayer.hitBox(mouseX, mouseY, color(100, 100, 100))) {
    level = 1;
  }
  if (twoPlayer.hitBox(mouseX, mouseY, color(100, 100, 100))) {
    level = 2;
    background(0);
  }
  popMatrix();

  ball.display();
  ball.update();

  if (ball.x < width/2) {
    if (paddleL.y > ball.y) {
      paddleL.y -= 1;
    } else if ((paddleL.y < width/2)) {
      paddleL.y += 1;
    }
  } else {
    if (paddleL.y > height/2) {
      paddleL.y -= 1;
    } else if (paddleL.y < height/2) {
      paddleL.y += 1;
    }
  }
  if (ball.x > width/2) {
    if (paddleR.y > ball.y) {
      paddleR.y -= 1;
    } else if ((paddleR.y < width/2)) {
      paddleR.y += 1;
    }
  } else {
    if (paddleR.y > height/2) {
      paddleR.y -= 1;
    } else if (paddleR.y < height/2) {
      paddleR.y += 1;
    }
  }
}
