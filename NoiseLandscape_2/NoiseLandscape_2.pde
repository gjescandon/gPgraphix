PImage nuImg;
FlockBox flock1,flock2,flock3;
NoizeBob lbob, rbob;
NoizeWave nwave;
QuilezFunctions qf;
WordFlyers words;
LlamaWalk ll;

void setup() {
  size(720,720, P3D);
  
  flock1 = new FlockBox(0.9,0.6);
  words = new WordFlyers();
  ll = new LlamaWalk();
  
  lbob = new NoizeBob(1.,0.007,0.5);
  rbob = new NoizeBob(1.,0.001,0.2);
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
  float rot = 0.1;
  scale(1.+rot);
  rotateZ(0-rot*rbob.getBob());
  translate(0-rot*width*rbob.getBobTail(1),0,100*rbob.getBobTail(10));
  pushMatrix();
  translate(0,0,-200);
  nwave.setGradient(0.1);
  popMatrix();  
  
  pushMatrix();
  float offset = qf.expSustainedImpulse(1.* frameCount / 100., 4., 0.8);
  //offset = 1.;
  //println(offset);
  
  translate(0.5*width,0.4*height ,90*offset);
  rotateX( (0.9*HALF_PI + 0.3*sin(0.006*frameCount))* offset);
  
  
  // layer 3
  
  pushMatrix();

  flock1.draw();
  popMatrix();
  
  
  
  popMatrix();
  //nwave.draw();
  //words.draw();
  
  if (frameCount > 20) ll.draw();
  //saveFrame();
  
  println(frameCount);
}
