Paddle paddleL = new Paddle();
void setup() {
 size(600,400,P2D); 
}
void draw() {
  background(51);
  paddleL.update();
  paddleL.display();
  
}