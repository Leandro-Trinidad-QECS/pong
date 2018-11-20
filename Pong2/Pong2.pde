/********* VARIABLES *********/
// 0:  Lobby
// 1:  One Player
// 2:  Two Player
// 3:  Game Over
// 4:  Test
int gameScreen = 4;
int gameLoc = 0;
boolean paused = false;
/********* FONT *********/

PFont JustMyType90;
PFont JustMyType50;
PFont JustMyType30;

/********* Score *********/

int scoreLeft = 0;
int scoreRight = 0;

/********* PADDLES/Balls *********/
Paddle paddleL;
Paddle paddleR;
Ball ball;
PVector ballHistory;


/********* Button *********/

Button firstPlayer;
void setup() {
  JustMyType90 = loadFont("JustMyType-90.vlw");
  JustMyType50 = loadFont("JustMyType-50.vlw");
  JustMyType30 = loadFont("JustMyType-30.vlw");
  size(858, 525, P2D);
  paddleL = new Paddle(20);
  paddleR = new Paddle(width-20);
  ball = new Ball();
  noStroke();
  
  firstPlayer = new Button(width/2,height/2,100,100,"JustMyTyple");
}
void draw() {

  switch(gameScreen) {
  case 0:
    lobby();
    return;
  case 1:
    onePlayer();
    gameLoc = 1;

    return;
  case 2:
    twoPlayer();
    gameLoc = 2;
    return;
  case 3:
    gameOver();
    return;
  case 4:
    test();
    return;
  }
}
void reset() {
}

void mousePressed() {
  if (gameScreen == 0) {
    if (pointRect(mouseX, mouseY, width/2, height/2-50, 160, 80)) {
      resetScore();
      gameScreen = 1;
    }
    if (pointRect(mouseX, mouseY, width/2, height/2+50, 160, 80)) {
      resetScore();
      gameScreen = 2;
    }
  }

  if (gameScreen == 1 || gameScreen == 2) {
    if (pointRect(mouseX, mouseY, 40, 30, 70, 40)) {
      if (paused) {
        paused = false;
      } else {
        paused = true;
      }
    }
  }

  if (gameScreen == 3) {
    if (pointRect(mouseX, mouseY, width/2, height/2, 145, 50)) {
      gameScreen = gameLoc;
      reset();
    }
    if (pointRect(mouseX, mouseY, width/2, height/2+60, 145, 50)) {
      gameScreen = 0;
      reset();
    }
  }
}
void keyReleased() {
  if (gameScreen == 1) {
    if (key == CODED) {
      if (keyCode == UP) {
        paddleL.move(0);
      } 
      if (keyCode == DOWN) {
        paddleL.move(0);
      }
    }
  }
  if (gameScreen == 2) {
    if (key == CODED) {
      if (keyCode == UP) {
        paddleR.move(0);
      } 
      if (keyCode == DOWN) {
        paddleR.move(0);
      }
    }
    if (key == 'w') {
      paddleL.move(0);
    } 
    if (key == 's') {
      paddleL.move(0);
    }
  }
}
void keyPressed() {


  if (gameScreen == 1) {
    if (key == CODED) {
      if (keyCode == UP) {
        paddleL.move(-5);
      } 
      if (keyCode == DOWN) {
        paddleL.move(5);
      }
    }
    if (key == 'p') {
      paused = !paused;
    }
  }
  if (gameScreen == 2) {
    if (key == CODED) {
      if (keyCode == UP) {
        paddleR.move(-5);
      } 
      if (keyCode == DOWN) {
        paddleR.move(5);
      }
    }
    if (key == 'w') {
      paddleL.move(-5);
    } 
    if (key == 's') {
      paddleL.move(5);
    }
  }
}


void drawDivider() {
  for (int i=10; i < height; i+= 10*2) {

    noStroke();
    rectMode(CENTER);
    fill(255-100);
    rect(width/2-1, i+1, 3, 10);
    fill(255);
    rect(width/2, i, 3, 10);
  }
}
void pauseButton() {
  fill(255);
  if (pointRect(mouseX, mouseY, 40, 30, 70, 40)) {
    fill(255);
    rectMode(CENTER);
    rect(40, 30, 70, 40);
    fill(0);
    fill(255);
    text("Hello",100,100);
  }

  textFont(JustMyType30);
  textSize(30);
  textAlign(CENTER, CENTER);
  if (paused) {
    fill(0);
    text("PLAY", 40, 30);
  } else {
    text("PAUSE", 40, 30);
  }
}

boolean collision(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) {

  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  } else {            // if not, return false
    return false;
  }
}
boolean pointRect(int px, int py, int rx, int ry, int rw, int rh) {

  // test for collision
  if (px >= rx-rw/2 && px <= rx+rw/2 && py >= ry-rh/2 && py <= ry+rh/2) {
    return true;    // if a hit, return true
  } else {            // if not, return false
    return false;
  }
}
