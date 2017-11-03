Paddle paddleL = new Paddle(20,400/2);
Paddle paddleAI = new Paddle(600-20,400/2);
Ball ball = new Ball();
int control;
void setup() {
  size(600, 400, P2D);
  smooth();
}
void draw() {
  background(51);
  paddleL.update();
  paddleL.display();
  //paddleAI.update();
  paddleAI.display();
  rect(width/2,height/2,2,height);
  
  if(paddleAI.y < ball.y) {
    paddleAI.y += ball.randSpeed;
  } else {
    paddleAI.y -= ball.randSpeed;
  }
  

  ball.update();
  ball.display();

  //controlls the paddle
  if (control == 1) {
    paddleL.y -= 10;
  }
  if (control == -1) {
    paddleL.y += 10;
  }
}
void mousePressed() {
  ball.reset();
}
void keyPressed() {
  if (key == 'w') {
    control = 1;
  }
  if (key == 's') {
    paddleL.y++;
    control = -1;
  }
}
void keyReleased() {
  if (key == 'w') {
    control = 0;
  }
  if (key == 's') {
    paddleL.y++;
    control = 0;
  }
}