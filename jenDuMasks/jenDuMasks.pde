QuilezFunctions qf;
GeoFunctions gf;
JdUnit jd;

NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1280 , 720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default

  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  jd = new JdUnit();
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  
  colorMode(RGB,1.);
  }

void draw() {
  
  background(0.);
  
  jd.draw();
  
  /*for (int i = 0; i< width; i++) {
   float hh = 0.5*height*qf.expStep(1.1*i/width, 200., 4.0);
   circle(i, hh, 10); 
    
  }
  */
  println(frameCount);
  saveFrame();
} 



// circles - works good
void drawCircles() {
  
  stroke(0.0);
  float sw = 50;
  strokeWeight(sw*swb.getBob());
  fill(1.);
  //pushMatrix();
  //translate(0,0,zbob.getBob());
  circle(0,0, 700 + 1000 * cb.getBobTail(1));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(10));
  circle(0,0, 400 + 1500 * cb.getBobTail(100));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));
  circle(0,0, 700 + 1000 * cb.getBobTail(200));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(100));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));

  circle(0,0, 400 + 1500 * cb.getBobTail(300));
  //popMatrix();
}
