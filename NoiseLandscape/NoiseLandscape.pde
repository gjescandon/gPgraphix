PImage nuImg;
FlockBox flock1,flock2,flock3;
NoizeBob lbob;
QuilezFunctions qf;
void setup() {
  size(720,720, P3D);
  
  flock1 = new FlockBox();
  flock2 = new FlockBox(0.7, 0.39);
  flock3  = new FlockBox(0.9, 0.33);
  
  lbob = new NoizeBob(1.,0.007,0.5);
  qf = new QuilezFunctions();
}

void draw() {
  colorMode(HSB,1.0);
  background(0.1);
  directionalLight(1., 0.0, 1., 0.06*sin(lbob.getBob()), 0.06*cos(lbob.getBobTail(1)), -1.);
  float tx = HALF_PI*lbob.getBob();
  //println(tx);
  pushMatrix();
  float offset = qf.expSustainedImpulse(1.* frameCount / 100., 4., 0.8);
  //offset = 1.;
  //println(offset);
  
  translate(0.5*width,0.5*height + 0.15*offset*height,70*offset);
  rotateX( 1.01*HALF_PI * offset);
  
  
  // layer 3
  
  pushMatrix();
  //translate(50*sin(0.1*frameCount),50*cos(0.1*frameCount),00);
  flock1.draw();
  popMatrix();
  
  
  // layer 2
  
  pushMatrix();
  translate(0,0,100);
  flock2.draw();
  popMatrix();
  
  // layer 1
  
  pushMatrix();
  translate(0,0,200);
  flock3.draw();
  popMatrix();
  
  popMatrix();
  saveFrame();
  println(frameCount);
}
