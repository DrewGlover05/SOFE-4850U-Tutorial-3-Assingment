float x = 50;
float speed = 3;
void setup() {
 size(500, 300);
}
void draw() {
 background(255);
 fill(100, 180, 255);
 circle(x, 150, 50);
 x = x + speed;
 if (x > width - 25 || x < 25) {
 speed = -speed;
 }
}