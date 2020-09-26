class AutoPalette{
//https://www.iquilezles.org/www/articles/palettes/palettes.htm  
  float a1 = 0.5;
  float a2 = 0.5;
  float a3 = 0.8;
  float b1 = 0.5;
  float b2 = 0.5;
  float b3 = 0.1;
  float c1 = 1.0;
  float c2 = 1.0;
  float c3 = 1.0;
  float d1 = 0.0;
  float d2 = 0.3;
  float d3 = 0.6;
  float factor = 1.0;
 AutoPalette(){
   d1 = 0.0;
   d2 = 0.3;
   d3 = 0.6;   
 }
 AutoPalette(float r){
   d1 = random(1);
   if (r < 0.3) {
     d2 = random(1);
   }
   if (r < 0.7) {
     d3 = random(1);
   }
 }
 AutoPalette(float r, float s){
   d1 = random(1);
   if (r < 0.3) {
     d2 = random(1);
   }
   if (r < 0.7) {
     d3 = random(1);
   }
   
   // power up
   c1 *= 1.+floor(random(1))%3;
   if (s < 0.3) {
     c2 *= 1.+ floor(random(1))%3;
   }
   if (s < 0.7) {
     c3 *= 1.+floor(random(1))%3;
   }
 }
 
 color getColor(float t0) {
  colorMode(HSB,1.0);
  float tnom = t0;   // between 0.0 and 1.0

  color c = color(100,100,100+ random(100));
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float r1 = factor * (a1 + b1f);
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));
  float r2 = factor * (a2 + b2f);
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float r3 = factor * (a3 + b3f);
  c = color(r1,r2,r3);
  return c;   
 }
}
