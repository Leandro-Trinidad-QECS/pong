<<<<<<< HEAD
Paddle paddleL = new Paddle(20, 400/2);
Paddle paddleAI = new Paddle(600-20, 400/2);
Ball ball = new Ball();
int control;
int scoreLeft = 0;
int scoreRight = 0;
boolean togg;
=======
Paddle paddleL;
Paddle paddleAI;
Ball ball = new Ball();
int control;
int control2;

boolean play2;
boolean keys;
>>>>>>> origin/master
void setup() {
  frameRate(60);
  size(600, 400, P2D);
  paddleL = new Paddle(20, height/2);
  paddleAI = new Paddle(width-20, height/2);
  smooth();
}
void draw() {
<<<<<<< HEAD

  background(0);
=======
  textSize(50);
  background(51);
  textAlign(CENTER,CENTER);
  text(paddleL.score, width/2-100, 50);
  text(paddleAI.score, width/2+100, 50);
>>>>>>> origin/master
  paddleL.update();
  paddleL.display();
  paddleAI.update();
  paddleAI.display();
<<<<<<< HEAD
  rect(width/2, height/2, 2, height);

  //ai paddle
  if (paddleAI.y < ball.y) {
    paddleAI.y += ball.randSpeed;
=======
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
>>>>>>> origin/master
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
<<<<<<< HEAD
=======
  //if (paddleAI.y < ball.y) {
  //  paddleAI.y += ball.randSpeed;
  //} else {
  //  paddleAI.y -= ball.randSpeed;
  //}
>>>>>>> origin/master


  ball.update();
  ball.display();

  //controlls the paddle
<<<<<<< HEAD
  if (!togg) {
    text("Key",100,height-10);
=======
  if (keys) {
    text("MOUSE", 100, height-50);
    paddleL.y = mouseY;
  } else {
    text("KEY", 100, height-50);
>>>>>>> origin/master
    if (control == 1) {
      paddleL.y -= 10;
    }
    if (control == -1) {
      paddleL.y += 10;
    }
<<<<<<< HEAD
  } else {
    text("Mouse",100,height-10);
    paddleL.y = mouseY;
=======
>>>>>>> origin/master
  }

  textSize(51);
  text(ball.scoreLeft, 100, 100);
  text(ball.scoreRight, width-100, 100);
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
<<<<<<< HEAD
  if (key == 'r') {
    if (togg) {
      togg = false;
    } else if (!togg) {
      togg = true;
=======

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
>>>>>>> origin/master
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