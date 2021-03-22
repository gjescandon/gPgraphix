Boxzz bxz;
QuilezFunctions qf;
NoizeBob cb;

void setup() {
  size(1280,720, P3D);
  
  // frameRate = 60 per sec default
  bxz = new Boxzz();
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.01, 0.3);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.);
  translate(0.5*width, 0.5*height);
  bxz.draw();
  //saveFrame();

} 
