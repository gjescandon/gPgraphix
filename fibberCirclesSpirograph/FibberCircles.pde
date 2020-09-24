class FibberCircles {
 int bpm;
 Spiropath spiro;
 QuilezEq qeq;
 int[] pos;
 
  FibberCircles(float toff){
    bpm = 100;//bpm_;
    spiro = new Spiropath(10,12,-5,10, toff);
    pos = new int[2];
    pos[0]=0;
    pos[1]=0;
    qeq = new QuilezEq();
  }
  
  void draw() {
    stroke(0.9);
    noFill();
    float xoff = 0.;
    float yoff = 0.;
    
    pos = spiro.getPosition();
    if (frameCount < 500) {      
      // f: release
      // k: attack
     xoff = qeq.expSustainedImpulse(1+frameCount,250, 250.0);
     pos[0] *= xoff;
     yoff = qeq.expSustainedImpulse(1+frameCount,250, 250.0);
     pos[1]  *= yoff;
    }
    pushMatrix();
    translate(wMid + pos[0], hMid + pos[1],0);
    //spiro.draw();
    float d = 0.618*(0.5*width + pow((sq(pos[0])+sq(pos[1])),0.5));

    pushMatrix();
    //rotate(0.3);

    drawCircle(d, pos[0], pos[1]);
    //draw2Circle(d);
    popMatrix();
    popMatrix();
  }
  
  void drawCircle(float d, float xoff, float yoff) {
    strokeWeight(d/23);

    circle(0,0,d);
    if (d > 0.0382*width) {
      float offset = 0.0382*d;
      float xoff2 = offset;
      float yoff2 = xoff2;
      if (xoff < 0) xoff2 = 0 - offset;
      if (yoff < 0) yoff2 = 0 - offset;
      pushMatrix();
      translate(0-xoff2,0-yoff2,0);

      drawCircle(0.618*d, xoff, yoff);
      popMatrix();
    }
  }
}
