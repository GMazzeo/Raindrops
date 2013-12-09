Raindrop[]droplet = new Raindrop[100];
Catcher catcher;
int score;
int index = 1;
int oldTime = 0;
int threshold = 2000;
PImage background;

void setup() {
  background = loadImage("Background.jpeg");
  size(background.width, background.height);
  for (int i = 0; i < droplet.length; i++) {
    droplet[i] = new Raindrop();
  }
  catcher = new Catcher();
}

void draw() {
  background(background);
  textSize(100);
  fill(0);
  text(score, 10, 100);
  catcher.display();
  catcher.update();
  if (millis() - oldTime>threshold) {
    if (index < droplet.length) {
      index++;
      oldTime = millis();
    }
  }
  for (int i = 0; i < index; i++) {
    droplet[i].display();
    droplet[i].fall();
    if (catcher.catchDrop(droplet[i]) == true) {
      droplet[i].caught();
      score++;
      threshold-=10;
    }
  }
  if (score == 10) {
    textMode(CENTER);
    textSize(50);
    fill(252, 33, 33);
    text("You reached Level 1", 75, height/2);
  }
  if (score == 25) {
    textMode(CENTER);
    textSize(50);
    fill(33, 78, 252);
    text("You reached Level 2", 75, height/2);
  }
  if (score == 50) {
    textMode(CENTER);
    textSize(100);
    fill(252, 218, 43);
    text("You win!", 100, height/2);
    
  }
}

