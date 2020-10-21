
NoizeBob polarBob, angleBob, radBob, colorBob, colorBob2, zBob, tBob;
float offsetAngle, angleInc;
color bc = color(100, 200, 100, 24);
WaveFunction wav;
void setup() {
  size(720, 720, P3D);
  polarBob = new NoizeBob(0.00001, 0.25, 0.6);
  angleBob = new NoizeBob(0.01, 1.0, 0.7);
  radBob = new NoizeBob(0.05, 1.5, 0.3, 0.3);
  offsetAngle = 0.0;
  angleInc = 0.067;
  wav = new WaveFunction(0.1, 1.0, 0.5 * PI);
  colorBob = new NoizeBob(0.5, 20.0, 0.4);
  colorBob2 = new NoizeBob(0.5, 20.0, 0.4);
  zBob = new NoizeBob(1.0, 240.0, 0.5);
  tBob = new NoizeBob(0.3, PI, 0.4);
}

void draw() {
 if (frameCount % 20 == 0) {
   redraw();
 }
 //saveFrame();
 }
void redraw() {
  colorMode(HSB, 100);
  float bcs = 50 + colorBob.getBob();
  bc = color(bcs, 100, 100);
 background(bc);

 
 
 float xx = 0.0; //0.5 * width;
 float yy = 0.5 * height;
 float wavy =  0.16 * (1 + wav.getWav());

 float rad = (0.1 + wavy) * width;
 offsetAngle += angleInc;
 translate(0.5 * width, 0, 0);
 rotateY(tBob.getBob() - 0.5*PI);
 for (float i = 0; i < 2 * PI; i += polarBob.getBobWithBreak()) {
   float radFactor = radBob.getBobWithBreak();
   pushMatrix();
   translate(0,0, zBob.getBob());
   fill(colorBob2.getBob(),100,100,84);   
   ellipse(xx + rad * cos(i + offsetAngle), yy + rad * sin(i + offsetAngle), 200 * radFactor , 200 * radFactor );
   popMatrix();
 }
}
 
