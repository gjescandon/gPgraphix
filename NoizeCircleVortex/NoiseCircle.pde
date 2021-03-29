class NoiseCircle {
  
    float nOff = 0.0;
    float ninc = 0.06;
    float rOff = 100;
    float thetaOff = 0.1;
    color currentColor;
    boolean isGrowing = false;
    boolean isBiggEnough = false;
    float rinc = 0.6;
    float[] rr;
    float rMin = 20.0;
    AutoPalette apal;
    NoizeBob cbob,  tbob;
    int iMax;
    QuilezFunctions qf;
    
  NoiseCircle(float defaultRadius) {
    rOff = defaultRadius;
    rMin = 20.0;
    ninc = 0.01 * random(1, 6);
    apal = new AutoPalette(0.5);
    cbob = new NoizeBob(1.0, 0.006*random(1),0.5);
    tbob = new NoizeBob(1.0, 0.006*random(1),0.5);
  }
  

  NoiseCircle() {
    rOff = height;
    qf = new QuilezFunctions();
    ninc = 0.01 * random(1, 6);  
    apal = new AutoPalette();
    cbob = new NoizeBob(1.0, 0.01,0.5);
    tbob = new NoizeBob(1.0, 0.001,0.5);
    iMax = 8;
    rr = new float[iMax];
    for (int i=0; i < iMax; i++) {
      rr[i] = rOff + i * 50;
    }
}


  void drawVortex() {
    
    float cb = cbob.getBob();
    for (int i = 0; i < iMax; i++) {
      float rq = rr[i] * qf.expSustainedImpulse(20.*rr[i]/height, 1., 1.);
      drawCircle(rq);
      rr[i] -= rinc;
      noFill();
      strokeWeight(1 + 10 * cbob.getBobTail(1 + i));

      stroke(apal.getColor(cbob.getBobTail(1 + 10*i)));
      if (rr[i] <= 0.) rr[i] = rOff;

    }
    
    //drawCircle(rr);
    
  }
  
  
  void drawCircle(float rIn) {
    float xOff = (0.5 * width);
    float yOff = (0.5* height);
    
    beginShape();
    
    thetaOff += 0.003*(tbob.getBob() - 0.5);
    float tc = 300.;
    float tInc = TWO_PI / tc;
    for (int i = 0 ; i < tc ; i ++) {
      
      float nrOff = 0.;
      nrOff = tbob.getBobTail(1+i);
      
      float r = rIn + (10 * sin(8.*i*tInc)) + (50 * nrOff);
      r = rIn + (10 * sin(8.*i*tInc));
      float lastX = xOff + r*sin(i*tInc + thetaOff);
      float lastY = yOff + r*cos(i*tInc + thetaOff);
      vertex(lastX, lastY);
    }
    endShape(CLOSE);
    
    

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
