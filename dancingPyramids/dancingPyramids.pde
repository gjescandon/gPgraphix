DancingPyramid dp;

void setup() {
  size(720, 720, P3D);
  
  dp = new DancingPyramid();
  
}

void draw() {
  colorMode(RGB, 100);
  background(0,100,0);
 //dp.draw();
 translate(0.5*width-25,0.5*height-15);
 pushMatrix();
 rotateX(0.3*sin(0.006*frameCount));
 rotateY(0.3*cos(0.006*frameCount));
 dp.drawPyramid();
 popMatrix();
 directionalLight(100, 100, 100, sin(0.006*frameCount), cos(0.006*frameCount), -1);
}
