class NoiseCircle {
  
    float nOff = 0.0;
    float ninc = 0.01;
    float rOff = 100;
    float thetaOff = 0.1;
    color currentColor;
    boolean isGrowing = false;
    boolean isBiggEnough = false;
    float rinc = 0.2;
    float[] rr;
    float rMin = 20.0;
    AutoPalette apal;
    NoizeBob cbob,  tbob;
    int iMax;
    
  NoiseCircle(float defaultRadius) {
    rOff = defaultRadius;
    rMin = 20.0;
    ninc = 0.01 * random(1, 6);
    apal = new AutoPalette(0.5);
    cbob = new NoizeBob(1.0, 0.006*random(1),0.5);
    tbob = new NoizeBob(1.0, 0.006*random(1),0.5);
    currentColor = getColor();
  }
  

  NoiseCircle() {
    rOff = height;
    ninc = 0.01 * random(1, 6);  
    apal = new AutoPalette(0.5);
    cbob = new NoizeBob(1.0, 0.001,0.5);
    tbob = new NoizeBob(1.0, 0.001,0.5);
    currentColor = getColor();
    iMax = 23;
    rr = new float[iMax];
    for (int i=0; i < iMax; i++) {
      rr[i] = rOff + i * 50;
    }
}


  void drawVortex() {
    
    for (int i = 0; i < iMax; i++) {
      drawCircle(rr[i]);
      rr[i] -= rinc;
      if (rr[i] <= 0.) rr[i] = rOff;

    }
    
    //drawCircle(rr);
    
  }
  
  
  void drawCircle(float rIn) {
    float xOff = (0.5 * width);
    float yOff = (0.5* height);
    
    beginShape();
    noFill();
    strokeWeight(1+4.*cbob.getBob());
    stroke(apal.getColor(cbob.getBobTail(100),0.8));
    
    thetaOff += 0.003*(tbob.getBob() - 0.5);
    for (float theta=0.0; theta<2*PI; theta+= 0.1) {
      float nrOff = 0.;
      nrOff = tbob.getBobTail(floor(10*theta));
      
      float r = rIn + (10 * sin(8*theta+200*nrOff)) + (50 * nrOff);
      r = rIn + (10 * sin(8*theta));
      float lastX = xOff + r*sin(theta + thetaOff);
      float lastY = yOff + r*cos(theta + thetaOff);
      vertex(lastX, lastY);
    }
    endShape(CLOSE);
    
    

}
  
  color getColor() {
    return apal.getColor(cbob.getBob(),0.8);
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
