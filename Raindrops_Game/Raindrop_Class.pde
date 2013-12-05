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
    image(raindrop, loc.x, loc.y, d, d);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
  }

  void reset() {
    loc.set(random(width), 0);
    vel.set(0, random(1, 4));
  }
  
  void caught() {
    loc.set(height*2, 0);
    vel.set(0,0);
    acc.set(0,0);
  }
}

