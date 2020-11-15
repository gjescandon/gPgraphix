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
  NoizeBob cbob;
  
 AutoPalette(){
   d1 = random(1);
   d2 = random(1);
   d3 = random(1);  
   cbob = new NoizeBob();
   cbob = new NoizeBob(1.0, 0.006, 0.6);
 }
 
 AutoPalette(float r){
   d1 = random(1);
     d2 = random(1);
     d3 = random(1);
     a1 = r;
     b1 = 0.2;
     b2 = 0.2;
   cbob = new NoizeBob(1.0, 0.001, 0.6);

 }
 AutoPalette(float r, float s){
   d1 = random(1);
     d2 = random(1);
     d3 = random(1);
     a1 = r;
     b1 = 0.2;
     b2 = 0.2;

   
   // power up
   c1 *= 1.+floor(s + random(1));
   c2 *= 1.+ floor(s + random(1));
     c3 *= 1.+floor(s+ random(1));

   cbob = new NoizeBob(0.2, 0.001, 0.6);

 }
 
 color getColor(float t0) {
  colorMode(HSB,1.0);
  float tnom = t0 - floor(t0);   // between 0.0 and 1.0

  color c;
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float h1 = factor * (a1 + b1f);
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));
  float s2 = factor * (a2 + b2f);
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float b3 = factor * (a3 + b3f);
  c = color(h1,s2,b3);
  return c;   
 }
 
 color getColor50(float t0){
   colorMode(HSB,1.0);
   color c = getColor(t0);  
   return color(hue(c), saturation(c), brightness(c), 0.5 + cbob.getBob());
 }
 
 void test() { 
   AutoPalette autoPal = new AutoPalette();
   for (int x=0; x < width; x++) {
   stroke(autoPal.getColor(1.0*x/width));
   line(x,0.6*height,x, 0.8*height);
   }  
 }
}
