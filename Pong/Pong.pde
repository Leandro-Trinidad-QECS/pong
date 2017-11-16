Paddle paddleL = new Paddle(20, 400/2);
Paddle paddleAI = new Paddle(600-20, 400/2);
Ball ball = new Ball();
int control;
int scoreLeft = 0;
int scoreRight = 0;
boolean togg;
void setup() {
  size(600, 400, P2D);
  smooth();
}
void draw() {

  background(0);
  paddleL.update();
  paddleL.display();
  paddleAI.update();
  paddleAI.display();
  rect(width/2, height/2, 2, height);


  ball.update();
  ball.display();

  if (ball.AIHit) {
    if (paddleAI.y > height/2) {
      paddleAI.y -= 5;
    } else if (paddleAI.y < height/2) {
      paddleAI.y += 5;
    }
  } else {
    //ai paddle
    if (paddleAI.y < ball.y) {
      paddleAI.y += ball.randSpeed;
    } else {
      paddleAI.y -= ball.randSpeed;
    }
  }
  ////controlls the paddle
  //if (!togg) {
  //  text("Key", 100, height-10);
  //  if (control == 1) {
  //    paddleL.y -= 10;
  //  }
  //  if (control == -1) {
  //    paddleL.y += 10;
  //  }
  //} else {
  //  text("Mouse", 100, height-10);
  //  paddleL.y = mouseY;
  //}

  textSize(51);
  text(ball.scoreLeft, 100, 100);
  text(ball.scoreRight, width-100, 100);
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
  if (key == 'r') {
    if (togg) {
      togg = false;
    } else if (!togg) {
      togg = true;
    }
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