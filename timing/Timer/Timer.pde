int oldTime = 0;
int currentTime = 0;
int timeChange = 0;

void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  ellipse(mouseX, mouseY, 30, 30);
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if(timeChange >= 2000) {
    fill(random(255), random(255), random(255), 100);
    ellipse(mouseX,mouseY,10,10);
    oldTime = currentTime;
  }
}
