Boxzz bxz;
QuilezFunctions qf;
NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1280,720, P3D);
  cnt = 5;
  // frameRate = 60 per sec default
  bxz = new Boxzz();
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
  translate(0.45*width + 0.1*width*xbob.getBob() , 0.45*height + 0.1*height*ybob.getBob());
  drawCircles();
  float t0 = 1.0 * TWO_PI / cnt;
  float off = 0.5*height;
  cb.getBob();
  
  rotateZ(sin(0.001*frameCount + zbob.getBob()));
  for (int i = 0; i < cnt; i++) {
    pushMatrix();
    translate(off*sin(i*t0)+off*0.5*xbob.getBobTail(10+i*100),off*cos(i*t0)+ off*0.5*ybob.getBobTail(10+i*100));
    scale(0.6);
    drawCircles();
    popMatrix();
  }
  println(frameCount);
  //saveFrame();
} 

void drawCircles() {
  
  stroke(0.0);
  float sw = 50;
  strokeWeight(sw*swb.getBob());
  fill(1.);
  //pushMatrix();
  //translate(0,0,zbob.getBob());
  circle(0,0, 400 + 1000 * cb.getBobTail(1));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(10));
  circle(0,0, 300 + 1000 * cb.getBobTail(100));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));
  circle(0,0, 400 + 1000 * cb.getBobTail(200));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(100));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));

  circle(0,0, 300 + 1000 * cb.getBobTail(300));
  //popMatrix();
}
