Whispers whisp;
QuilezFunctions qf;
NoizeBob cb;
LoseWaves lw;
TriangleFibber tf;
Pfibbers pyr;
PImage timg;
PikatrixRuler pr;

void setup() {
  size(1280,720, P3D);
  
  // frameRate = 60 per sec default
  //whisp = new Whispers();
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.01, 0.3);
  lw = new LoseWaves();
  //tf = new TriangleFibber(13);
  pyr = new Pfibbers();
  pr = new PikatrixRuler();
  
}

void draw() {
  colorMode(HSB,1.0);
  background(0.2);
  cb.getBob();
  directionalLight(cb.getBobTail(1), map(cb.getBobTail(1), 0., 1., 0., 0.4) ,1., sin(cb.getBobTail(1)), cos(cb.getBobTail(1)), -1);

  lw.draw();

  pr.draw();
  
  pyr.draw();
  
  println(frameCount );
  saveFrame();

} 
