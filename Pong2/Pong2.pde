/********* VARIABLES *********/
// 0:  Lobby
// 1:  One Player
// 2:  Two Player
// 3:  Game Over

int gameScreen = 0;

/********* FONT *********/

PFont JustMyType90;

/********* Score *********/

int scoreLeft = 0;
int scoreRight = 0;

/********* PADDLES/Balls *********/
Paddle paddleL;
Paddle paddleR;
Ball ball;
PVector ballHistory;
void setup() {
  JustMyType90 = loadFont("JustMyType-90.vlw");
  size(858, 525, P2D);
  paddleL = new Paddle(20,height/2);
  paddleR = new Paddle(width-20,height/2);
  ball = new Ball();
}
void draw() {
  
  switch(gameScreen) {
  case 0:
    lobby();
    return;
  case 1:
    onePlayer();
    return;
  case 2:
    twoPlayer();
  case 3:
    gameOver();
  }
  
}

void drawDivider() {
  for(int i=10; i < height; i+= 10*2){
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(width/2,i,3,10);
  }
  
}

boolean collision(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) {
  
  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}