color c = color(int(random(255)), int(random(255)), int(random(255)));
Paddle paddle;
Ball ball;
void setup() {
  size(500, 500);
  paddle = new Paddle(width/2,height-50);
  ball = new Ball(width/2,height-50,10);
}
void draw() {
  background(51);
  paddle.update();
  paddle.display();
  paddle.x = mouseX;
  
  ball.update();
  ball.display();
}