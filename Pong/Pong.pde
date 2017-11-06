Paddle paddleL = new Paddle(20, 400/2);
Paddle paddleAI = new Paddle(600-20, 400/2);
Ball ball = new Ball();
int control;
int control2;
boolean keys;
void setup() {
  //frameRate(70);
  size(600, 400, P2D);
  smooth();
}
void draw() {
  textSize(50);
  background(51);
  text(paddleL.score, 100, 100);
  text(paddleAI.score, width-100, 100);
  paddleL.update();
  paddleL.display();
  paddleAI.update();
  paddleAI.display();
  rect(width/2, height/2, 2, height);


 if (control2 == 1) {
      paddleAI.y -= 10;
    }
    if (control2 == -1) {
      paddleAI.y += 10;
    }
  //if (paddleAI.y < ball.y) {
  //  paddleAI.y += ball.randSpeed;
  //} else {
  //  paddleAI.y -= ball.randSpeed;
  //}


  ball.update();
  ball.display();

  //controlls the paddle
  if (keys) {
    text("MOUSE", 100, height-10);
    paddleL.y = mouseY;
  } else {
    text("KEY", 100, height-10);
    if (control == 1) {
      paddleL.y -= 10;
    }
    if (control == -1) {
      paddleL.y += 10;
    }
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
  if (key == 'r') {
    if (keys) {
      keys = false;
    } else {
      keys = true;
    }
  }
  if(key == 'o') {
    control2 = 1;
  }
  if (key == 'l') {
    control2 = -1;
  }
}
void keyReleased() {
  if (key == 'w') {
    control = 0;
  }
  if (key == 's') {
    control = 0;
  }
  if(key == 'o') {
    control2 = 0;
  }
  if (key == 'l') {
    control2 = 0;
  }
}