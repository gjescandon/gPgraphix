Spirograph spiro;
void setup() {
  size(720, 720);
  setupSpiroSeeds();
  SpiroSeed seed = new SpiroSeed();
  colorMode(HSB, 1.0);
  println(seed.getR1());
  println(seed.getR2());
  spiro = new Spirograph(seed, color(0.3, .0, 1.0), color(0.6, .0, 1.0), 10);  
}

void draw() {
  spiro.draw();
  println(frameCount);
}
