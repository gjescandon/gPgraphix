TriangleCircle tc1, tc2, tc3, tc4;
Mandala1 mandala1;
NoizeBob xBob, yBob;
float duty = 0.8;
AutoPalette apal;
  void setup() {
  size(1280,720, P3D);
  frameRate(28);
  tc1 = new TriangleCircle(100, true);
  tc2 = new TriangleCircle(200, false);
  tc3 = new TriangleCircle(300, true);
  tc4 = new TriangleCircle(500, true);
  mandala1 = new Mandala1();
  background(0);
  
  xBob = new NoizeBob(1.0, 0.4);
  yBob = new NoizeBob(0.3, 0.4);
  apal = new AutoPalette();
}

void draw() {
 //background(0);
 rotateX(sin(xBob.getBob()));
 rotateY(sin(yBob.getBob()));
 
  
 colorMode(HSB, 1.0);
 //directionalLight(0, 0, 100, 0.5, -1.0, -1.0);
 mandala1.draw();
 
 //saveFrame();
}
