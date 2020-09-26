AutoPalette autoPal;
void setup() {
  size(720, 720);
  autoPal = new AutoPalette(random(1));
}

void draw() {
 colorMode(HSB,1.0);
 background(autoPal.getColor(0.0));
 fill(autoPal.getColor(0.5));
 for (int x=0; x < width; x++) {
   stroke(autoPal.getColor(1.0*x/width));
   strokeWeight(4);
   float xr = x+random(width);
   if (xr > width) xr -= width;
   circle(xr,random(height), random(67));
   line(x,0.6*height,x, 0.8*height);
 }
 
 noLoop();
}
