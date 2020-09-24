FibberCircles dice;
float wMid,hMid;
void setup() {
  size(720,720, P3D); 
  dice = new FibberCircles(100);
  
  wMid = 0.5*width;
  hMid = 0.5*height;
}

void draw() {
  colorMode(HSB,1.0);
  background(0.);
  //line(wMid,0,wMid,height);
  dice.draw();
}
