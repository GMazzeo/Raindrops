class Raindrop {
  PVector loc, vel, acc;
  PImage raindrop;
  boolean active = true;
  float d;

  Raindrop() {
    raindrop = loadImage("Raindrop.png");
    //The raindrops will begin at a random width, with a height above the viewing screen
    loc = new PVector(random(0, width), -d);
    vel = new PVector(0, 2);
    acc = new PVector(0, random(.01, .03));
    d = 10;
  }

  void display() {
    //Create the raindrop
    image(raindrop, loc.x, loc.y, d, d);
  }

  void fall() {
    //Set the velocity to make the raindrops fall
    vel.add(acc);
    loc.add(vel);
  }

  void caught() {
    //If the raindrop falls in the bucket, it disapears from the game
    if (active == false) {
      loc.set(width*2, 0);
      vel.set(0, 0);
      acc.set(0, 0);
    }
  }

  void speed() {
    vel.y+=.75;
  }

  void levelCheck(int level) {
    if (level==1) {
      vel = new PVector(0, 2);
    }
    if (level==2) {
      vel = new PVector(0, 3);
    }
    if (level==3) {
      vel = new PVector(0, 4);
    }
  }
}

