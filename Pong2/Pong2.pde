

/********* VARIABLES *********/
// 0:  Lobby
// 1:  One Player
// 2:  Two Player
// 3:  Game Over
// 4:  Test

int gameScreen = 0;
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
Button twoPlayer;


/********* Sounds *********/

Minim minim;
AudioPlayer player;

//sound manager
soundManager explosionSM;
soundManager clickSM;
soundManager pauseSM;
soundManager hitSM;


void setup() {
  JustMyType90 = loadFont("JustMyType-90.vlw");
  JustMyType50 = loadFont("JustMyType-50.vlw");
  JustMyType30 = loadFont("JustMyType-30.vlw");
  size(858, 525, P2D);
  paddleL = new Paddle(20);
  paddleR = new Paddle(width-20);
  ball = new Ball();
  noStroke();

  firstPlayer = new Button(width/2, height/2, 100, 100, "Player 1");
  twoPlayer = new Button(width/2, height/2+120, 100, 100, "Player 2");
  minim = new Minim(this);

  explosionSM = new soundManager(new String[]{"explosion.wav", "explosion2.wav", "explosion3.wav"});
  clickSM = new soundManager(new String[]{"click.wav", "click2.wav", "click3.wav"});
  pauseSM = new soundManager(new String[]{"pause.wav", "pause2.wav", "pause3.wav"});
  hitSM = new soundManager(new String[]{"bounce.wav", "bounce2.wav", "bounce3.wav"});
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

void test() {
  background(0);
}

void mousePressed() {

  if (gameScreen == 1 || gameScreen == 2) {
    if (pointRect(mouseX, mouseY, 40, 30, 70, 40)) {
      pauseSM.play();
      if (paused) {
        paused = false;
      } else {
        paused = true;
      }
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
  }
  if (gameScreen == 1 || gameScreen == 2) {
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

  //clear the corner
  fill(0);
  rect(40, 30, 70, 40);

  fill(255);
  if (pointRect(mouseX, mouseY, 40, 30, 70, 40)) {
    fill(255);
    rectMode(CENTER);
    rect(40, 30, 70, 40);
    fill(0);
  }

  textFont(JustMyType30);
  textSize(30);
  textAlign(CENTER, CENTER);
  if (paused) {
    text("PLAY", 40, 30);
    pauseMenu();
  } else {
    text("PAUSE", 40, 30);
  }
}

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



void lobby() {
  surface.setTitle("Pong");

  /********* Setup lobby *********/
  background(0);
  textFont(JustMyType90);
  //drawScore();
  textAlign(CENTER, CENTER);
  //drawScore();
  textAlign(CENTER, CENTER);
  fill(255-100);
  text("PONG", width/2-3, 100+3);
  fill(255);
  text("PONG", width/2, 100);

  /********* Balls and Paddles *********/
  ball.display();
  ball.update();
  paddleL.display();
  paddleL.update();


  /********* Moving the left paddle *********/
  if (ball.x < width/2) {
    float targetY = ball.y;
    float dy = targetY - paddleL.y;
    paddleL.y += dy * paddleL.easing;
  } else {
    float targetY = height/2;
    float dy = targetY - paddleL.y;
    paddleL.y += dy * paddleL.easing;
  }


  paddleR.display();
  paddleR.update();


  /********* moving right paddle *********/
  if (ball.x > width/2) {
    float targetY = ball.y;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  } else {
    float targetY = height/2;
    float dy = targetY - paddleR.y;
    paddleR.y += dy * paddleR.easing;
  }

  /********* buttons *********/
  firstPlayer.show();
  if (firstPlayer.isPressed()) {
    gameScreen = 1;
    resetScore();
  }

  twoPlayer.show();
  if (twoPlayer.isPressed()) {
    gameScreen = 2;
    resetScore();
  }
}


void drawScore() {
  textFont(JustMyType90);
  textAlign(RIGHT);
  fill(255-100);
  text(scoreLeft, width/2-100-3, 100+3);
  fill(255);
  text(scoreLeft, width/2-100, 100);

  textAlign(LEFT);
  fill(255-100);
  text(scoreRight, width/2+100-3, 100+3);
  fill(255);
  text(scoreRight, width/2+100, 100);
}

void resetScore() {
  ball.reset();
  scoreLeft = 0;
  scoreRight = 0;
  paddleL.reset();
  paddleR.reset();
}


void onePlayer() {

  pauseButton();
  if (!paused) {

    background(0);
    pauseButton();
    drawScore();
    drawDivider();
    paddleL.display();
    paddleR.display();
    paddleL.update();

    if (ball.x > width/2) {
      float targetY = ball.y;
      float dy = targetY - paddleR.y;
      paddleR.y += dy * paddleR.easing;
    } else {
      float targetY = height/2;
      float dy = targetY - paddleR.y;
      paddleR.y += dy * paddleR.easing;
    }
    paddleR.update();

    ball.display();
    ball.update();
  }
}

void pauseMenu() {
  textFont(JustMyType90);
  textAlign(CENTER, CENTER);
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/2, 200, 85);
  fill(255-100);
  text("Paused", width/2-3, height/2+3);
  fill(0);
  text("Paused", width/2, height/2);
}

void twoPlayer() {
  surface.setTitle("Pong | 2 Players");
  pauseButton();

  if (!paused) {
    background(0);
    pauseButton();
    drawDivider();
    drawScore();
    paddleL.display();
    paddleR.display();
    paddleL.update();
    paddleR.update();
    ball.display();
    ball.update();
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
