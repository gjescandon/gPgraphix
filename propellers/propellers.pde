Horizon[] horizons;
void setup() {
  size(1280, 720);
  horizons = new Horizon[8];
  horizons[0] = new Horizon(2, 0.2, 0.001, 300);
  horizons[1] = new Horizon(4, 0.4, 0.005, 300);
  horizons[2] = new Horizon(6, 0.3, 0.08, 100);
  horizons[3] = new Horizon(2, 0.2, 0.09, 10);
  horizons[4] = new Horizon(4, 0.4, 0.005, 80);
  horizons[5] = new Horizon(6, 0.3, 0.01, 80);
  horizons[6] = new Horizon(6, 0.6, 0.01, 50);
  horizons[7] = new Horizon(6, 0.6, 0.01, 50);
}

void draw() {
 background(56, 128, 200);
 for (int i = 0; i< horizons.length; i++) {
   horizons[i].draw();
 }
}

class Horizon{
 float yoff, yinc, xoff, xinc;
 float ynot, yMax;
 color myFill, myStroke;
 int octaveCount;
 float noiseLevel;
 float ydrift, driftInc;
 
 Horizon(int octaveCount_, float noiseLevel_, float ninc_, float yMax_) {
   ynot = 0.0;
   yoff = 0.0;
   yinc = (0.001 + 0.1 * random(0, 1));
   xoff = 0.0;
   xinc = ninc_;
   myFill = getMyColor();
   myStroke = getMyColor();
   octaveCount = octaveCount_;
   noiseLevel = noiseLevel_;
   yMax = yMax_;
   ydrift = 0.0;
   driftInc = (0.001 + 0.005 * random(0, 1));
   if (random(0, 1) > 0.6) {
     driftInc = - driftInc;
   }
   
 }
 
  void draw() {
   xoff = 0.0;
   noiseDetail(octaveCount, noiseLevel);
   fill(myFill);
   stroke(myStroke);
   
   pushMatrix();
   translate(width * 0.5 , height * 0.5 );
   pushMatrix();
   rotate(ydrift);
   pushMatrix();
   beginShape();
   for (int i=0; i< 2 * width; i++) {
     float y = ynot + cos(yoff / 10) * map(noise(xoff, yoff), 0, 1, 0, yMax);
     float x = -0.75 * width + i;
     vertex(x, y);
     xoff += xinc;
   }
   for (int i= 2 * width; i>= 0; i--) {
     float y = ynot - cos(yoff / 10) * map(noise(xoff, yoff), 0, 1, 0, yMax); 
     float x = i - width * 0.75;
     vertex(x, y);
     xoff -= xinc;
   }
   endShape(CLOSE);
   popMatrix();
   popMatrix();
   popMatrix();
   
   yoff += yinc;
   ydrift += driftInc;
   if (random(0, 1) > 0.995) {
     driftInc = - driftInc;
   }
  }
  
  color getMyColor() {
   return color(floor(256 * random(0, 1)), floor(256 * random(0, 1)), floor(256 * random(0, 1))); 
  }
}
