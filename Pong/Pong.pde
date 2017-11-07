Paddle paddleL;
Paddle paddleAI;
Ball ball = new Ball();
int control;
int control2;

boolean play2;
boolean keys;
void setup() {
  frameRate(60);
  size(600, 400, P2D);
  paddleL = new Paddle(20, height/2);
  paddleAI = new Paddle(width-20, height/2);
  smooth();
}
void draw() {
  textSize(50);
  background(51);
  textAlign(CENTER,CENTER);
  text(paddleL.score, width/2-100, 50);
  text(paddleAI.score, width/2+100, 50);
  paddleL.update();
  paddleL.display();
  paddleAI.update();
  paddleAI.display();
  for (int i=0; i < 25; i++) {
    pushMatrix();
    noStroke();
    rect(width/2, i*20, 5, 10);
    popMatrix();
  }



  if (play2) {
    if (control2 == 1) {
      paddleAI.y -= 10;
    }
    if (control2 == -1) {
      paddleAI.y += 10;
    }
  } else {
    if (ball.lookFor) {
      if (paddleAI.y < ball.y) {
        paddleAI.y += ball.randSpeed;
      } else if (paddleAI.y > ball.y +10)  {
        paddleAI.y -= ball.randSpeed;
      }
    } else {
      if (paddleAI.y < height/2) {
        paddleAI.y += ball.randSpeed;
      } else if (paddleAI.y > height/2+10) {
        paddleAI.y -= ball.randSpeed;
      }
    }
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
    text("MOUSE", 100, height-50);
    paddleL.y = mouseY;
  } else {
    text("KEY", 100, height-50);
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

  //Left Paddle
  if (key == 'w') {
    control = 1;
  }
  if (key == 's') {
    paddleL.y++;
    control = -1;
  }

  //Toggle keys
  if (key == 'r') {
    if (keys) {
      keys = false;
    } else {
      keys = true;
    }
  }

  if (key == 't') {
    if (play2) {
      play2 = false;
    } else {
      play2 = true;
    }
  }

  if (play2) {
    if (key == 'o') {
      control2 = 1;
    }
    if (key == 'l') {
      control2 = -1;
    }
  }
}
void keyReleased() {
  if (key == 'w') {
    control = 0;
  }
  if (key == 's') {
    control = 0;
  }
  if (key == 'o') {
    control2 = 0;
  }
  if (key == 'l') {
    control2 = 0;
  }
}