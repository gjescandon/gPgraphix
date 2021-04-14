class AutoPaletteRGB{
//https://www.iquilezles.org/www/articles/palettes/palettes.htm  
  float a1 = 0.6; // red : center
  float a2 = 0.5;  // blue : center
  float a3 = 0.6;  // green : center
  float b1 = 0.4;
  float b2 = 0.2;
  float b3 = 0.2;
  float c1 = 1.0;
  float c2 = 1.0;
  float c3 = 1.0;
  float d1 = 0.;
  float d2 = 0.3;
  float d3 = 0.6;
  float factor = 1.0;
  
 AutoPaletteRGB(){
   c1 = random(2);
     c2 = random(2);
     c3 = random(2);
   d1 = random(1);
     d2 = random(1);
     d3 = random(1);     
 }
 
 AutoPaletteRGB(float r){
   d1 = random(1);
     d2 = random(1);
     d3 = random(1);
   a1 = r;
   a2 = 0.2;
 }
 
 AutoPaletteRGB(float hue, float sat, float brit){
   c1 = random(2);
     c2 = random(2);
     c3 = random(2);
   d1 = random(1);
     d2 = random(1);
     d3 = random(1);    
     
   a1 = hue;
   a2 = sat;
   a3 = brit;
   
   b1 = 0.2;
   b2 = 0.2;
   b3 = 0.2;
   
 }
 
 color getColor(float t0) {
  colorMode(HSB,1.0);
  float tnom = t0 - floor(t0);   // between 0.0 and 1.0

  color c;
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float h1 = factor * (a1 + b1f);
  h1 = h1 - floor(h1);
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));

  float s2 = constrain(factor * (a2 + b2f), 0.0, 1.0);
  
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float b3 = constrain(factor * (a3 + b3f), 0.0, 1.0);
  c = color(h1,s2,b3);
  c = color(h1,s2,b3);
  return c;   
 }
 
 color getColorDark(float t0) {
   
   a3 = 0.3;
   b3 = 0.1;
  colorMode(HSB,1.0);
  float tnom = t0 - floor(t0);   // between 0.0 and 1.0

  color c;
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float h1 = factor * (a1 + b1f);
  h1 = h1 - floor(h1);
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));
  float s2 = constrain(factor * (a2 + b2f), 0.0, 1.0);
  
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float b3 = constrain(factor * (a3 + b3f), 0.0, 1.0);
  c = color(h1,s2,b3);
  return c;   
 }
 
 
 
 color getColor50(float t0){
   colorMode(HSB,1.0);
   color c = getColor(t0);  
   return color(hue(c), saturation(c), brightness(c), 0.7);
 }
 
 void test() { 
   AutoPaletteRGB autoPal = new AutoPaletteRGB();
   for (int x=0; x < width; x++) {
   stroke(autoPal.getColor(1.0*x/width));
   line(x,0.6*height,x, 0.8*height);
   }  
 }
}
