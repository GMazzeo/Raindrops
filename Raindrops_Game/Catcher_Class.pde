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
  void catchDrop(Raindrop fall) {
    if (loc.dist(fall.loc) < d/2 + fall.d/2) {
      fall.loc.set(width*2, -17);
      fall.vel.set(0, 0);
      fall.acc.set(0, 0);
      fall.active = true;
      score++;
      threshold-=10;
    }
  }
  void miss(Raindrop fall) {
    if (fall.loc.y > height) {
      fall.loc.set(-width, height*-17);
      fall.vel.set(0, 0);
      fall.active = true;
      lives--;
      if (lives == 0) {
        gameOver = true;
        start = false;
      }
    }
  }
}
