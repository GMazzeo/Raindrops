class Catcher {
  PVector loc; 
  PImage bucket;
  int d;

  Catcher() {
    bucket = loadImage("bucket.png");
    d = 50;
    loc = new PVector(mouseX, height-d);
  }
  
  void display() {
    image(bucket, loc.x, loc.y, d, d);
  }
  
  void update() {
    loc.set(mouseX, height-d);
  }
  
  boolean catchDrop(Raindrop fall) {
    if (loc.dist(fall.loc) < d/2 + fall.d/2) {
      fall.caught();
      return true;
    }
    else {
      return false;
    }
  }
}
    

