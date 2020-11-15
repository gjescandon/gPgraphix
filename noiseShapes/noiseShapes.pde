PImage nuImg;
NoizeShape ns1, ns2, ns3;
void setup() {
  size(720,720, P3D);
  
  ns1 = new NoizeShape();
  ns2 = new NoizeShape();
  ns3 = new NoizeShape();
  
  background(24,24,0);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.2);
  strokeWeight(5.0);
  float toff1 = 0.0;
  ns1.drawRotating(toff1);
  
//  translate(0,0,-1);
  ns1.drawRotating(toff1+ 0.5*PI);
  float toff2 = 0.33*TWO_PI;
  //translate(0,0,-1);
  ns2.drawRotating(toff2);
  ns2.drawRotating(toff2+0.5*PI);
  float toff3 = 0.67*TWO_PI;
  //translate(0,0,-1);
  ns3.drawRotating(toff3);
  ns3.drawRotating(toff3+0.5*PI);
  
  
  println(frameCount);
}
