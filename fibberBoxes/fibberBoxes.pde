PImage nuImg;

NoizeBob zBob;
NoizeBob_2D yBob;
QuilezFunctions qeq;
AutoPalette apal;
color bc;
float h0, w0;
float tFib;

void setup() {
  size(720,720, P3D);
  colorMode(HSB, 1.);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  zBob = new NoizeBob(200., 0.0003, 0.7);
  yBob = new NoizeBob_2D(10., 0.0003, 0.3);
  apal = new AutoPalette(random(1));
  bc = apal.getColor(random(1));
  qeq = new QuilezFunctions();
  w0 = 0.5*width;
  h0 = 0.5*height;
  tFib = 137.5*TWO_PI/360;
}

void draw() {
  background(0.9);
  int dmax = 8;
  float bw = 1.*width/dmax;
  bw= 200;
  zBob.getBob();
  yBob.getBob();
  //translate(0,0,-300);
  directionalLight(1.,0.,1.,0.5*sin(0.01*frameCount),0.,-1);
  rotateX(0.1*sin(0.001*frameCount) - 0.2*PI);
  //rotateX(-0.4);
  translate(w0-50*sin(0.01*yBob.getBob()), h0-50*cos(0.01*yBob.getBob()), 0);
  pushMatrix();
  rotateY(0.1*(0.01*frameCount));
  box(zBob.getBob());
  for(int i = 0; i < 21; i++) {
    pushMatrix();
    translate(bw*cos(i*tFib+ 0.005*zBob.getBobTail(i*10)), bw*sin(i*tFib+ 0.005*zBob.getBobTail(i*10)), 0-8*i);
    noStroke();
    fill(apal.getColor50(0.005*zBob.getBobTail(i*10)));
    box(zBob.getBobTail(1+i));
    popMatrix();
  }
  popMatrix();
  
}
