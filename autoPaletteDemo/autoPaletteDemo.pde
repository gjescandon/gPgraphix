AutoPalette autoPal;
void setup() {
  size(720, 720);
  autoPal = new AutoPalette(random(1),0.2);
}

void draw() {
 for (int x=0; x < width; x++) {
   stroke(autoPal.getColor((1.0*x)));
   line(x,0,x,height);
 }
 
 noLoop();
}
