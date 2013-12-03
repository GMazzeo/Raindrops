Raindrop[]droplet = new Raindrop[500];

void setup() {
  size(500,500);
  for (int i = 0; i < droplet.length; i++) {
    droplet[i] = new Raindrop();
  }
}

void draw() {
  background(12, 14, 116);
  for (int i = 0; i < droplet.length; i++) {
    droplet[i].display();
    droplet[i].drop();
    if (droplet[i].loc.y > height + droplet[i].d) {
      droplet[i].reset();
    }
}
