CurveLineBuilder clb;
QuilezFunctions qf;
NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1280,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default
  clb = new CurveLineBuilder();
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  background(0.);
  }

void draw() {
  colorMode(HSB,1.0);
  //background(0.);
  directionalLight(1.,0.,1.,sin(xbob.getBob()),cos(xbob.getBobTail(1)),-1);
  clb.draw();
  println(frameCount);
  //saveFrame();
} 



// circles - works good
void drawCircles() {
  
  stroke(0.0);
  float sw = 50;
  strokeWeight(sw*swb.getBob());
  fill(1.);
  //pushMatrix();
  //translate(0,0,zbob.getBob());
  circle(0,0, 1000 + 1000 * cb.getBobTail(1));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(10));
  circle(0,0, 600 + 1500 * cb.getBobTail(100));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));
  circle(0,0, 700 + 1000 * cb.getBobTail(200));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(100));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));

  circle(0,0, 800 + 1500 * cb.getBobTail(300));
  //popMatrix();
}
