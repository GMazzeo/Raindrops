Raindrop[]droplet = new Raindrop[500];
Catcher catcher;
boolean start;
boolean stop;
boolean gameOver;
int score;
int index = 1;
int oldTime = 0;
int threshold = 2000;
int lives;
PImage background;
PImage lady;

void setup() {
  //Set the background
  background(0);
  background = loadImage("Background.jpeg");
  size(background.width, background.height);
  lady = loadImage ("lady with umbrella.png");
  lives = 10;
  //Create conditions for when the raindrop class will be activated
  for (int i = 0; i < droplet.length; i++) {
    droplet[i] = new Raindrop();
  }
  catcher = new Catcher();
  start = true;
  gameOver = false;
}

void draw() {
  //Create start Screen
  if (start == true && stop == false) {
    rectMode(CENTER);
    fill(163, 90, 242);
    rect(width/2, height/2, 200, 70);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(60);
    fill(255);
    text("Start!", width/2, height/2);
    imageMode(CENTER);
    image(lady, 65, 245, 75, 100);
  }
  //Start the game
  if (start == false && stop == false) { 
    background(background);
    textSize(75);
    fill(0);
    text(score, 50, 50);
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
      if (droplet[i].loc.y > height && droplet[i].loc.y < height+droplet[i].d/2) {
        lives--;
      }
    }
    //Set the standards for the game
    //Level one is passed when the score is equal to 10
    if (score == 10) {
      textMode(CENTER);
      textSize(40);
      fill(252, 33, 33);
      text("You passed Level 1", 275, height/2);
    }
    //Level two is passed when the score is equal to 25
    if (score == 50) {
      textMode(CENTER);
      textSize(40);
      fill(33, 78, 252);
      text("You passed Level 2", 275, height/2);
    }
    if (score == 100) {
      stop = true;
    }
  }
  //The game is won when the score is equal to 50
  if (stop == true) {
    background(255,242,126);
    textMode(350);
    textAlign(CENTER);
    fill(255);
    text("You win!", 250, height/2);
  }
  if (lives == 0) {
    gameOver = true;
  }
  if (gameOver == true) {
    background(0);
    textMode(350);
    textAlign(CENTER);
    fill(252, 0, 0);
    text("You Lose!", 250, height/2);
  }
}



//To start game 
void mousePressed() {
  if (mouseY<height/2+35 && mouseY>height/2-35 && mouseX<width/2+100 && mouseX>width/2-100) {
    start=false;
  }
}

//To make raindrops fall quicker
void mouseDragged() {
  for (int i = 0; i < index; i++) {
    droplet[i].speed(); 
  }
}

