class AutoPalette{
//https://www.iquilezles.org/www/articles/palettes/palettes.htm  
  float a1 = 0.6; // hue : center
  float a2 = 0.6;  // sat : center
  float a3 = 0.6;  // bright : center
  float b1 = 1.;
  float b2 = 0.2;
  float b3 = 0.2;
  float c1 = 1.0;
  float c2 = 1.0;
  float c3 = 1.0;
  float d1 = 0.;
  float d2 = 0.3;
  float d3 = 0.6;
  float factor = 1.0;
  
 AutoPalette(){
   c1 = 1+floor(random(10));
     c2 = random(2);
     c3 = random(2);
   d1 = 1+floor(random(10));
     d2 = random(1);
     d3 = random(1); 
     
   if (c1 == d2) c1++;
   
   a1 = 0.1*floor(random(10));
   println("a1 " + a1);
 }
 
 AutoPalette(float r){
   c1 = 1+floor(random(10));
     c2 = random(2);
     c3 = random(2);
   d1 = 1+floor(random(10));
     d2 = random(1);
     d3 = random(1); 
     
   if (c1 == d1) c1++;
   println(c1);
   println(d1);
   
   a1 = r;
   a2 = 0.2;
 }
 
 AutoPalette(float hue, float sat, float brit){
   
   c1 = 1+floor(random(10));
     c2 = random(2);
     c3 = random(2);
   d1 = 1+floor(random(10));
     d2 = random(1);
     d3 = random(1); 
     
   if (c1 == d1) c1++;
   println(c1);
   println(d1);
   
   println("a1 " + hue);
   a1 = hue;
   a2 = sat;
   a3 = brit;
   
   b1 = 1.;
   b2 = 0.2;
   b3 = 0.2;
   
 }
 
 color getColor(float t0) {
  colorMode(HSB,1.0);
  float tnom = t0 - floor(t0);   // between 0.0 and 1.0

  color c;
  //float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float b1f = b1 * cos(TWO_PI*c1*tnom)*cos(PI *d1 * tnom);
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
 
 color getColorHue(float t0) {
  colorMode(HSB,1.0);
  float tnom = t0 - floor(t0);   // between 0.0 and 1.0

  color c;
  float b1f = b1 * cos(TWO_PI*(c1*tnom+d1));
  float h1 = factor * (a1 + b1f);
  h1 = h1 - floor(h1);
  float b2f = b2 * cos(TWO_PI*(c2*tnom+d2));

  float a2h = a2 * (1.0- abs(h1-a1));
  float s2 = constrain(factor * (a2h + b2f), 0.0, 1.0);
  
  float b3f = + b3 * cos(TWO_PI*(c3*tnom+d3));
  float a3h = a3 * (1.0 - abs(h1-a1));
  float b3 = constrain(factor * (a3h + b3f), 0.0, 1.0);
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
   AutoPalette autoPal = new AutoPalette();
   for (int x=0; x < width; x++) {
   stroke(autoPal.getColor(1.0*x/width));
   line(x,0.6*height,x, 0.8*height);
   }  
 }
}
