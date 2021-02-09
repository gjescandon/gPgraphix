float theta0 = 0.1;
float thetaFib0 = (2*PI*137.5/360);
float thetaFib = 0.0;
float thetaFibInc = 0.003;
float thetaFibX = thetaFib;
NoiseCircle ncircle50, ncircle100, ncircle150;
NoiseCircle[] ncircleArr;
int ncSize = 5;
void setup() {
  size(1280,720);
  ncircleArr = new NoiseCircle[ncSize];
  for (int i = 0; i < ncSize ; i++) {
    ncircleArr[i] = new NoiseCircle(20);
  }
  
}

void draw() {
  
  background(0);
  strokeWeight(4);
  stroke(0,0,244);
  
  ncircleArr[0].isGrowing = true;
  for (int i = 0; i < ncSize ; i++) {
    ncircleArr[i].drawNoiseCircle();
    if (i > 0 && ncircleArr[i - 1].isBiggEnough) {
      ncircleArr[i].isGrowing = true;
    }
  }
  
  drawGoldenSpiral(0 - thetaFib);
  
  
  stroke(0,0,100);
  drawGoldenSpiral(0 - thetaFib - thetaFib0);
  stroke(0,0,150);
  drawGoldenSpiral(0 - thetaFib - 2* thetaFib0);
  stroke(0,0,200);
  drawGoldenSpiral(0 - thetaFib - 3*thetaFib0);
  
  thetaFib += thetaFibInc;
  thetaFibX += thetaFibInc;
  
  if (thetaFib > 2*PI) {
    thetaFib -= 2*PI;
  }
  
}

void drawGoldenSpiral(float thetaOff) {
  noFill();
    beginShape();
  //vertex(width/2,height/2);
  //vertex(100+width/2,height/2);
  float xoff = width/2;
  float yoff = height/2;
  float e = 2.718;
  float a = 10;
  float r = 0;
  float thetaMax = (3.5 + 0.5 * noise(thetaFibX)) * PI; 
  //float thetaMax = (3 + 0.1) * PI; 
  float lastX = 0.0;
  float lastY = 0.0;
  
  for (float theta = 0.0; theta < thetaMax; theta += theta0){
    float exp = 0.3063489 * theta;
    r = a * pow(e,exp);
    println(r);
    lastX = xoff + r*sin(theta + thetaOff);
    lastY = yoff + r*cos(theta+ thetaOff);
    vertex(lastX, lastY);
  }
  endShape();
  ellipse(lastX, lastY, 8.0, 8.0);
  thetaFibX += thetaFibInc;
}
