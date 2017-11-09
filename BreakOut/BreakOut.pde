Paddle paddle;
Ball ball;

boolean wait = true;
void setup() {
  size(500, 500);

  paddle = new Paddle(width/2, height-50, 70, 10);
  ball = new Ball();
}
void draw() {
  paddle.x = mouseX;
  background(51);
  paddle.update();
  paddle.display();
  ball.update();
  ball.display();

  if (wait) {
    ball.x = paddle.x;
    ball.y = paddle.y-10;
  }
}
void mousePressed() {
  wait = false;
}