FibberCircles c1, c2, c3;
float wMid,hMid;
void setup() {
  size(720,720, P3D); 
  c1 = new FibberCircles(0.);
  c2 = new FibberCircles(0.3*PI);
  c3 = new FibberCircles(0.6*PI);
  
  wMid = 0.5*width;
  hMid = 0.5*height;
}

void draw() {
  colorMode(HSB,1.0);
  background(0);
  //line(wMid,0,wMid,height);
  c1.draw();
  c2.draw();
  c3.draw();
  
}
