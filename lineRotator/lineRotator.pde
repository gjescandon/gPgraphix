float theta, thetaInc;

void setup() {
 size(720,702,P3D); 
  theta = 0.;
  thetaInc = 0.01;
}

void draw() {
  
  translate(0.5*width, 0.5*height,0);
  pushMatrix();
  rotateZ(theta);
  line(0,0-0.5*height,0,0.5*height);
  popMatrix();
  theta += thetaInc;
  if (theta>TWO_PI) theta = 0.;
}
