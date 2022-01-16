// Particles, by Daniel Shiffman.

ParticleSystem ps;
PImage sprite;  
Spirograph spiro;
Point pp;
float theta, thetaInc;
int psize = 1000;
float ss0 = 1.1;
FlockBox flock;
NoizeBob lbob;

void setup() {
  size(720, 720, P3D);
  //orientation(LANDSCAPE);
  sprite = loadImage("0goldball_10.png");
  ps = new ParticleSystem(psize);
  setupSpiroSeeds();
  SpiroSeed seed = new SpiroSeed();
  seed.print();
  colorMode(HSB, 1.0);
  
  spiro = new Spirograph(seed, color(0.3, .0, 1.0), color(0.6, .0, 1.0), 10);  
  flock = new FlockBox();
  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
  
  
  theta = 0.;
  thetaInc = 2.0/psize;
  lbob = new NoizeBob(1.0,0.007,0.5);
} 

void draw () {
  background(0.4);
  ps.update();
  ps.display();
  
  directionalLight(0.9, 0.0, 0.9, sin(0.0001*frameCount*lbob.getBob()), sin(0.0001*frameCount*lbob.getBobTail(10000)), -1.);
  flock.draw();
  
  Point pp = spiro.getPoint(theta);
  theta += thetaInc;
  if (theta >= TWO_PI) theta = 0.;
  float ss = ss0 * (0.7 + 0.3 * sin(0.01*frameCount));
  float zoff = 300 + 100*sin(0.01*frameCount);
  
  pushMatrix();
  ps.setEmitter(0.5*width + ss * pp.xx, 0.5*height + ss * pp.yy, zoff);
  popMatrix();
  
  saveFrame();
  println(frameCount);
  
}
