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
    AutoPalette apal;
    NoizeBob cbob,  tbob;
    
  NoiseCircle(float defaultRadius) {
    rOff = defaultRadius;
    rMin = 20.0;
    ninc = 0.01 * random(1, 6);
    apal = new AutoPalette(0.5);
    cbob = new NoizeBob(1.0, 0.01*random(1),0.5);
    tbob = new NoizeBob(1.0, 0.01*random(1),0.5);
    currentColor = getColor();
  }
  

  NoiseCircle() {
    rOff = 100;
    ninc = 0.01 * random(1, 6);  
    apal = new AutoPalette(0.5);
    cbob = new NoizeBob(1.0, 0.006*random(1),0.5);
    tbob = new NoizeBob(1.0, 0.0031*random(1),0.5);
    currentColor = getColor();
}


  void drawNoiseCircle() {
    float xOff = (0.5 * width)+(0.4*width*xnPropOff - 0.2*width);
    float yOff = (0.5* height)+(0.4*height*ynPropOff - 0.2*height);
    
    beginShape();
    fill(getColor());
    strokeWeight(1+4.*cbob.getBob());
    stroke(apal.getColor(cbob.getBobTail(100),0.8));
    
    thetaOff += 0.003*(tbob.getBob() - 0.5);
    for (float theta=0.0; theta<2*PI; theta+= 0.1) {
      float nrOff = 0.;
      nrOff = tbob.getBobTail(floor(10*theta));
      
      float r = rOff + (10 * sin(8*theta+200*nrOff)) + (50 * nrOff);
      
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
