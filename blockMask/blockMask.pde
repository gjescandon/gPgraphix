Boxzz bxz;
QuilezFunctions qf;
NoizeBob cb,xb,yb;

void setup() {
  size(1280,720, P3D);
  
  // frameRate = 60 per sec default
  bxz = new Boxzz();
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.01, 0.3);
  xb = new NoizeBob(1.0, 0.001, 0.3);
  yb = new NoizeBob(1.0, 0.001, 0.3);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.);
  translate(0.2*height+0.7*width*xb.getBob(), 0.2*height+0.7*height*yb.getBob());
  bxz.draw();
  println(frameCount);
  //saveFrame();

} 
