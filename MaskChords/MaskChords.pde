Chords ch;
QuilezFunctions qf;
NoizeBob cb;

void setup() {
  size(1280,720, P3D);
  
  // frameRate = 60 per sec default
  ch = new Chords();
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.001, 0.3);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.);
  translate(0.3*width + 0.4 * width * cb.getBob(), 0.45*height + 0.1*height*(1-cb.getBobTail(10)));
  ch.draw();
  println(frameCount);
  saveFrame();

} 
