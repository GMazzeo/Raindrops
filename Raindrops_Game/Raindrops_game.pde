Raindrop[]droplet = new Raindrop[50];
Catcher catcher;
int score;
int index = 1;
int oldTime = 0;
int threshold = 2000;
PImage background;

void setup() {
  //Set the background
  background = loadImage("Background.jpeg");
  size(background.width, background.height);
  //Create conditions for when the raindrop class will be activated
  for (int i = 0; i < droplet.length; i++) {
    droplet[i] = new Raindrop();
  }
  catcher = new Catcher();
}

void draw() {
  background(background);
  textSize(75);
  fill(0);
  text(score, 10, 100);
  //Display the catcher and have it move 
  catcher.display();
  catcher.update();
  //Create a timer so that one raindrop falls one at a time 
  if (millis() - oldTime>threshold) {
    if (index < droplet.length) {
      index++;
      oldTime = millis();
    }
  }
  for (int i = 0; i < index; i++) {
    droplet[i].display();
    droplet[i].fall();
    //Create conditions so that the score increases each time a raindrop interacts with the bucket
    if (catcher.catchDrop(droplet[i]) == true) {
      droplet[i].caught();
      score++;
      threshold-=10;
    }
  }
  //Set the standards for the game
  //Level one is passed when the score is equal to 10
  if (score == 10) {
    textMode(CENTER);
    textSize(40);
    fill(252, 33, 33);
    text("You passed Level 1", 80, height/2);
  }
  //Level two is passed when the score is equal to 25
  if (score == 25) {
    fill(33, 78, 252);
    text("You passed Level 2", 80, height/2);
  }
  //The game is won when the score is equal to 50
  if (score == 50) {
    textMode(CENTER);
    textSize(75);
    fill(252, 218, 43);
    text("You win!", 115, height/2);
  }
}
