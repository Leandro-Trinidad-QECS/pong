class Ball {
  float x;
  float y;
  float w;
  float deltaX;
  float deltaY;
  Ball(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;


    //random angle
    //float deg = int(random(80,-80));
    float deg = int(random(80, -80));
    float rad = radians(deg);
    print(deg, " ", rad);
    float angle = random(rad);
    deltaX = -5 * sin(angle);
    deltaY = -5 * cos(angle);

    //TODO: get the ball to launh with an angle
  }
  void update() {
    x += deltaX;
    y += deltaY;
    if (x<0 || x > width) {
      deltaX *= -1;
    }
    if (y < 0 || y > height) {
      deltaY *= -1;
    }
    if (collision(int(paddle.x), int(paddle.y), int(paddle.w), int(paddle.h), int(x), int(y), int(w))) {
       float diff = x - (paddle.x - paddle.w/2);
        float rad = radians(45);
        float angle = map(diff, 0, paddle.w, rad, -rad);
        
        deltaX = 5 * cos(angle);
        deltaY =  5 * sin(angle);
    }
  }
  void display() {
    ellipse(x, y, w, w);
  }
}