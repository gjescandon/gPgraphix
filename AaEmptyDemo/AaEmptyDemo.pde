Boxzz bxz;
QuilezFunctions qf;
GeoFunctions gf;
MaskCirclesAlt mask;

NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1280,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default
  bxz = new Boxzz();
  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  mask = new MaskCirclesAlt();
  colorMode(HSB,1.);
  }

void draw() {
  
  background(0.);
  float a = 0.1 * width;
  float b = 0.1 * height;
  float c = 0.8 * width;
  float d = 0.8 * height;
  
  fill(0.9);
  rect(a, b, c ,d);
  
  GPoint gp1 = new GPoint(a,b);
  GPoint gp2 = new GPoint(a+c, b+d);
  float dd = gf.getLen(gp1, gp2);
  
  fill(0.7);
  rect(a,b, dd - c, d);
  
  noFill();
  rect(a,b, d, d);
  rect(c+a-d,b, d, d);
  
  //saveFrame();
  int bpm = 70;
  int bpmms = 1000*1*60/bpm;
  println(bpmms + " "+ millis() + " " + floor(millis()/bpmms));
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
