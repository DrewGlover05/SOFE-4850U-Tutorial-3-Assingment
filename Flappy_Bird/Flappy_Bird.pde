float speed = -1;
float birdY = 10;
float gravity = 0.05;
float velocity = 0;
float[] pipeX = {500, 775};
float[] pipeY = {random(75, 200), random(75, 200)};

void setup() {
  size(500, 300);
}
void draw() {
  
  // background
  background(173, 216, 230);

  // draw bird
  drawBird();
  
  // birds movement (gravity + input)
  velocity += gravity;
  birdY += velocity;
  if (birdY >= 275) birdY = 275;
  if (birdY <= 25) birdY = 25;
  if (keyPressed){
    if (key == ' ') velocity = -2;
  }
  
  // obstacles
  for (int x = 0; x < 2; x++){
    drawObstacle(pipeY[x], pipeX[x]);
    pipeX[x] += speed;
    if (pipeX[x] == -50) {
      pipeX[x] = 500;
    }
  }
}

void drawBird() {
  fill(255,255,0);
  circle(250, birdY, 50);
}

void drawObstacle(float rectY, float rectX){
  fill(0,200,0);
  rect(rectX, (rectY + 75), 50, 400);
  rect(rectX, (rectY - 75), 50, -400);
}
