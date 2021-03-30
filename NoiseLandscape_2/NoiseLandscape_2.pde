PImage nuImg;
FlockBox flock1,flock2,flock3;
NoizeBob lbob;
NoizeWave nwave;
QuilezFunctions qf;
void setup() {
  size(1280,720, P3D);
  
  flock1 = new FlockBox(0.7,0.5);

  
  lbob = new NoizeBob(1.,0.007,0.5);
  qf = new QuilezFunctions();
  nwave = new NoizeWave();
}

void draw() {
  colorMode(HSB,1.0);
  background(0.1);
  directionalLight(1., 0.0, 1., 0.06*sin(lbob.getBob()), 0.06*cos(lbob.getBobTail(1)), -1.);
  float tx = HALF_PI*lbob.getBob();
  //println(tx);
  //nwave.setGradient();
  
  pushMatrix();
  translate(0,0,-200);
  nwave.setGradient();
  popMatrix();  
  
  pushMatrix();
  float offset = qf.expSustainedImpulse(1.* frameCount / 100., 4., 0.8);
  offset = 1.;
  //println(offset);
  
  translate(0.5*width,0.5*height + 0.08*offset*height,70*offset);
  rotateX( 0.9*HALF_PI * offset);
  
  
  // layer 3
  
  pushMatrix();

  flock1.draw();
  popMatrix();
  
  
  
  popMatrix();
  nwave.draw();

  saveFrame();
  
  println(frameCount);
}
