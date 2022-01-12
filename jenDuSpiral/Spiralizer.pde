class Spiralizer {
  // get points on a spiral
  // each request gets a point at a great radius
  // Archimedian spiral : r = a + b*theta;
  
  float theta;
  float rad;
  float tinc;
  float a,b;
  NoizeBob tbob; 
 Spiralizer () {
   theta = 0.;
   rad = 0.;
   tinc = 2.7;
   a = random(10.);
   b = 20. + random(13.);
   tbob = new NoizeBob();
 }
 
 
 Spiralizer (int offset_) {
   theta = 0.;
   rad = 0.;
   tinc = 2.7;
   if (random(1) < 0.5) tinc = 0.-tinc;
   a = random(10.);
   b = 20. + random(13.);
   tbob = new NoizeBob();
   theta = offset_*tinc;
   rad = a + b * theta;
   
 }
 
 
 GPoint getPoint() {
   float rad = a + b * theta;
   float x = rad * cos(theta);
   float y = rad * sin(theta);
   GPoint p = new GPoint(floor(x), floor(y));
   theta += tinc * tbob.getBob();
   return p;
 }
}
