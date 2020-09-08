DancingStar dstar;

void setup() {
  size(720, 720);
  
  dstar = new DancingStar();
  
}

void draw() {
  background(255);
 dstar.draw();
 //drawCircle1();
 //drawCircle2();
}


void drawCircle1() {
  float r = 100;
  float x0 = 0.5 * width;
  float y0 = 0.5 * height;
  float tDelta = 0.4*PI;
  float tOffset = 1.6*PI - 1.5*PI;
 for (int i = 0; i < 3; i++) {
   float x = x0 + r * cos(i*tDelta - tOffset);
   float y = y0 + r * sin(i*tDelta - tOffset);
   point(x, y);
 }
}
void drawCircle2() {
  float r = 70;
  float x0 = 0.5 * width;
  float y0 = 0.5 * height;
  float tDelta = 0.4*PI;
  float tOffset = 0.1*PI;
 for (int i = 0; i < 3; i++) {
   float x = x0 + r * cos(i*tDelta - tOffset);
   float y = y0 + r * sin(i*tDelta - tOffset);
   point(x, y);
 }
}

void drawEllipse(float a, float b) {
  float r = 100;
  float x0 = 0.5 * width;
  float y0 = 0.5 * height;
  float tDelta = 0.1*PI;
  float tOffset = 0.1*PI;
 for (int i = 0; i < 5; i++) {
   float x = x0 + a * cos(i*tDelta );
   float y = y0 +b * sin(i*tDelta );
   point(x, y);
 }
}
