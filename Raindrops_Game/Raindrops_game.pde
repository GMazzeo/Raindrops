int index = 1;
int oldTime=0;
int threshold = 2000;
Raindrop[]droplet = new Raindrop[500];
Catcher catcher;
int score;

void setup() {
  size(600, 600);
  for (int i = 0; i < droplet.length; i++) {
    droplet[i] = new Raindrop();
  }
  catcher = new Catcher();
}

void draw() {
  background(12, 14, 116);
  textSize(100);
  fill(0);
  text(score, 10, 100);
  for (int i = 0; i < index; i++) {
    droplet[i].display();
    droplet[i].fall();
    if (catcher.catchDrop(droplet[i]) == true) {
      droplet[i].caught();
      score++;
      threshold-=10;
    }
  }
  catcher.display();
  catcher.update();
  if (millis() - oldTime>threshold) {
    if (index < droplet.length) {
      index++;
      oldTime = millis();
    }
  }
}

