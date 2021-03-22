class AutoPalette{
//https://www.iquilezles.org/www/articles/palettes/palettes.htm  
  float a1 = 0.6; // hue
  float a2 = 0.5;  // sat
  float a3 = 0.7;  // bright
  float b1 = 0.4;
  float b2 = 0.5;
  float b3 = 0.1;
  float c1 = 1.0;
  float c2 = 1.0;
  float c3 = 1.0;
  float d1 = 0.;
  float d2 = 0.3;
  float d3 = 0.6;
  float factor = 1.0;
  
 AutoPalette(){
   b1 = random(1);
   b2 = random(1);
   b3 = random(1);   
   c1 = random(1);
   c2 = random(1);
   c3 = random(1);   
   d1 = random(1);
   d2 = random(1);
   d3 = random(1);   
 }
 
 AutoPalette(float r){
   if (r > 0.) {
   d1 = 0.;
   d2 = random(1);
   d3 = random(1);
   b1 = 0.;
   c1 = 0.2;
   b2 = random(1);
   b3 = random(1);
   c2 = random(1);
   c3 = random(1);
     a1 = r;
     a2 = 0.8;     
   } else {
     
    a1 = 0.06;
    a2 = 0.8;
    a3 = 0.7;
    b1 = 0.0;
    b2 = 0.7598794;
    b3 = 0.27705252;
    c1 = 0.2;
    c2 = 0.64681566;
    c3= 0.41414648;
    d1 = 0.0;
    d2 = 0.5445565;
    d3 = 0.74633074; 
   }
   
   println("a1 : " + a1);
   println("a2 : " + a2);
   println("a3 : " + a3);
   println("b1 : " + b1);
   println("b2 : " + b2);
   println("b3 : " + b3);
   println("c1 : " + c1);
   println("c2 : " + c2);
   println("c3 : " + c3);
   println("d1 : " + d1);
   println("d2 : " + d2);
   println("d3 : " + d3);
   
   
 }
 
 AutoPalette(float r, float s){
   d1 = random(1);
     d2 = random(1);
     d3 = random(1);
   
   // power up
   c1 *= 1.+random(2);
     c2 *= 1.+ random(2);
     c3 *= 1.+ random(2);

     a1 = r;
     a2 = 0.2;

 }

  AutoPalette(float hue, float s, float sat){
   d1 = random(1);
     d2 = random(1);
     d3 = random(1);
   
   // power up
   c1 *= 1.+random(s);
     c2 *= 1.+ random(s);
     c3 *= 1.+ random(s);

     a1 = hue;
     a2 = sat;

 }

 color getColor(float t0, float sat) {
  colorMode(HSB,1.0);
  float tnom = t0-floor(t0);   // between 0.0 and 1.0
  float thisSat = sat;
  
  color c;
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float h1 = factor * (a1 + b1f);
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));
  float s2 = factor * (thisSat + b2f);
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float b3 = factor * (a3 + b3f);
  c = color(h1,s2,b3);
  return c;   
 }
 
 color getColor(float t0) {
  colorMode(HSB,1.0);
  float tnom = t0-floor(t0);   // between 0.0 and 1.0

  color c;
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float h1 = factor * (a1 + b1f);
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));
  float s2 = factor * (a2 + b2f);
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float b3 = factor * (a3 + b3f);
  c = color(constrain(h1, 0., 1.), constrain(s2, 0., 1.), constrain(b3, 0., 1.));
  return c;   
 }
 
 color getColorMute(float t0) {
  colorMode(HSB,1.0);
  float tnom = t0-floor(t0);   // between 0.0 and 1.0

  color c;
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float h1 = factor * (a1 + constrain(b1f, 0., 1.));
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));
  float s2 = factor * (a2 + constrain(b2f, 0., 1.));
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float b3 = factor * (a3 + b3f);
  c = color(constrain(h1, 0., 1.), constrain(s2, 0., 1.), constrain(b3, 0., 1.));
  return c;   
 } 
 
 color getColor50(float t0){
   colorMode(HSB,1.0);
   color c = getColor(t0);  
   return color(hue(c), saturation(c), brightness(c), 0.7);
 }
 
 void test() { 
   AutoPalette autoPal = new AutoPalette();
   for (int x=0; x < width; x++) {
   stroke(autoPal.getColor(1.0*x/width));
   line(x,0.6*height,x, 0.8*height);
   }  
 }
}
