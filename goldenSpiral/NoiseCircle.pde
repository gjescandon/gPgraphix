class NoiseCircle {
  
    float nOff = 0.0;
    float ninc = 0.01;
    float rOff = 100;
    float thetaOff = 0.1;
    color currentColor;
    boolean isGrowing = false;
    boolean isBiggEnough = false;
    float rinc = 2.0;
    float rMin = 20.0;
    
  NoiseCircle(float defaultRadius) {
    rOff = defaultRadius;
    rMin = 20.0;
    ninc = 0.01 * random(1, 6);
    currentColor = getColor();
  }

  NoiseCircle() {
    rOff = 100;
    ninc = 0.01 * random(1, 6);  
    currentColor = getColor();
}


  void drawNoiseCircle() {
    if (!isGrowing) {
      return;
    }
    noiseDetail(4, 0.4);
    if (random(1) > 0.9) {
      currentColor = getColor();
    }
    //fill(currentColor);
    noFill();
    stroke(currentColor);
    float xOff = 0.5 * width;
    float yOff = 0.7 * height;
    
    beginShape();
    for (float theta=0.0; theta<2*PI; theta+= 0.1) {
      float nrOff = noise(nOff + theta);

      float r = rOff + (10 * sin(8*theta)) + (100 * nrOff * sin(theta / 2));

      float lastX = xOff + r*sin(theta + thetaOff);
      float lastY = yOff + r*cos(theta + thetaOff);
      vertex(lastX, lastY);
    }
    endShape(CLOSE);
    nOff += ninc;
    rOff += rinc;
    if (rOff > height) {
      reset();
    }
    
    if (rOff > 5 * rMin) {
      isBiggEnough = true;
    }
  }
  
  color getColor() {
    color[] colors= new color[5];
    colors[0] = color(0,0,234);
    colors[1] = color(0,234,0);
    colors[2] = color(0,0,123);
    colors[3] = color(0,123,0);
    colors[4] = color(0,234,123);
    color result = colors[floor(random(5))];
   return result; 
  }
  
  void reset() {
    nOff = 0.0;
    thetaOff = 0.1;
    isGrowing = false;
    isBiggEnough = false;
    ninc = 0.01 * random(1, 6);      
    rOff = rMin;

  }
}
