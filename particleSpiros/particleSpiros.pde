// Particles, by Daniel Shiffman.

ParticleSystem ps;
PImage sprite;  
Spirograph spiro;
Point pp;
float theta, thetaInc;
int psize = 1000;
float ss0 = 1.7;

void setup() {
  size(1024, 768, P2D);
  orientation(LANDSCAPE);
  sprite = loadImage("0goldball_10.png");
  ps = new ParticleSystem(psize);
  setupSpiroSeeds();
  SpiroSeed seed = new SpiroSeed();
  seed.print();
  colorMode(HSB, 1.0);
  println(seed.getR1());
  println(seed.getR2());
  spiro = new Spirograph(seed, color(0.3, .0, 1.0), color(0.6, .0, 1.0), 10);  
  
  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
  
  
  theta = 0.;
  thetaInc = 3.0/psize;
} 

void draw () {
  background(0);
  ps.update();
  ps.display();
  
  Point pp = spiro.getPoint(theta);
  theta += thetaInc;
  if (theta >= TWO_PI) theta = 0.;
  float ss = ss0 * (1 + 0.5 * sin(0.01*frameCount));
  ps.setEmitter(0.5*width + ss * pp.xx, 0.5*height + ss * pp.yy);
  
  fill(255);
  textSize(16);
  text("Frame rate: " + int(frameRate), 10, 20);
  
}
