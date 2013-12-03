class Raindrop {
  PVector loc, vel, acc;
  float d;

  Raindrop() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, .05);
    acc = new PVector(0, random(.001, .003));
    d = random(1, 5);
  }

  void display() {
    ellipse(loc.x, loc.y, d, d);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
  }

  void reset() {
    if (loc.y>height) {
      loc.y=0;
      vel.y=.05;
    }
}
}

