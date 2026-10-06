float speed = -1;
float birdX = 50;
float birdY = 150;
float gravity = 0.05;
float velocity = 0;
float[] pipeX = {500, 775};
float[] pipeY = {random(75, 200), random(75, 200)};
PImage bird;


void setup() {
  size(500, 300);
  
  
}
void draw() {
  // background
  PImage bg;
  bg = loadImage("bg.png");
  bg.resize(500,300);
  background(bg);

  // start screen
  Boolean gameStarted;
  
  if (key == ' '){
    gameStarted = true;
    gravity = 0.05;
    speed = -1;
  }
  else {
   gameStarted = false;
   drawStart();
  }
    
  // draw bird
  drawBird();
  
  // birds movement (gravity + input)
  velocity += gravity;
  birdY += velocity;
  if (birdY >= 275) birdY = 275;
  if (birdY <= 25) birdY = 25;
  if (keyPressed && gameStarted == true){
    if (key == ' ') velocity = -2;
  }
  
  // pipes
  for (int x = 0; x < 2; x++){
    drawPipe(pipeY[x], pipeX[x]);
    pipeX[x] += speed;
    if (pipeX[x] == -50) {
      pipeX[x] = 500;
    }
  }
  
  // collision
      for (int x = 0; x < 2; x++) {
    
      // horizontal collision
      if (birdX + 25 > pipeX[x] &&
          birdX - 25 < pipeX[x] + 50) {
    
        // vertical collision
        if (birdY - 25 < pipeY[x] - 75 ||
            birdY + 25 > pipeY[x] + 75) {
    
          drawEnd();
        }
      }
    }
   //
  if ( birdY == 25 || birdY == 275){
      drawEnd();
  }
}

// function to draw bird
void drawBird() {
  bird = loadImage("bird.png");
  // center the image
  imageMode(CENTER);
  image(bird,birdX,birdY);
}

// function to draw pipe
void drawPipe(float rectY, float rectX){
  fill(0,200,0);
  rect(rectX, (rectY + 75), 50, 400);
  rect(rectX, (rectY - 75), 50, -400);
}

//function to draw lose screen
void drawEnd(){
  // semi transparent rectangle to darken the screen
  fill(0,0,150);
  rect(0,0,500,300);
  
  fill(255);
  textSize(32);
  textAlign(CENTER,CENTER);
  text("GAME OVER", 250, 130);
  textSize(18);
  text("PRESS ENTER TO START", 250, 180);
  velocity = 0;
  speed = 0;
  // restart game
  if (keyPressed){
    if (key == ENTER){
      birdY = 150;
      pipeX[0] = 500;
      pipeX[1] = 775;
      speed = -1;
    }
  }
}

//function to draw the start screen
void drawStart(){
  // semi transparent rectangle to darken the screen
  fill(0,0,150);
  rect(0,0,500,300);
  
  fill(255);
  textSize(32);
  textAlign(CENTER,CENTER);
  text("FLAPPY BIRD", 250, 150);
  textSize(16);
  textAlign(CENTER,CENTER);
  text("Press Space to Start",250,120);
  
  velocity = 0;
  speed = 0;
  gravity = 0;
}
