class Catcher {
  PVector loc; 
  PImage bucket;
  int d;

  Catcher() {
    bucket = loadImage("bucket.png");
    d = 25;
    loc = new PVector(mouseX, height-d);
  }
  
  void display() {
    //Display the bucket on the bottom of the screen 
    //Set it so that it will move with the mouse
    image(bucket, loc.x, loc.y, d, d);
  }
  
  void update() {
    loc.set(mouseX, height-d);
  }
  
  //Set the conditions for when the raindrop reaches the bucket
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
