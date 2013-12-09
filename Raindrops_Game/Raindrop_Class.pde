class Raindrop {
  PVector loc, vel, acc;
  PImage raindrop;
  float d;

  Raindrop() {
    raindrop = loadImage("Raindrop.png");
    loc = new PVector(random(width), -d);
    vel = new PVector(0, 2);
    acc = new PVector(0, random(.01, .03));
    d = 12;
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
    loc.set(height*2, 0);
    vel.set(0,0);
    acc.set(0,0);
  }
}

