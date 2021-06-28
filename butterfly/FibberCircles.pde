class FibberCircles {
 int bpm;
 Spiropath spiro;
 QuilezFunctions qeq;
 float[] pos;
 float wMid = 0.5*width;
 float hMid = 0.5*height;
 GeoFunctions gf;
 
  FibberCircles(){
    bpm = 100;//bpm_;
    spiro = new Spiropath(10,12,-5,10);
    pos = new float[2];
    pos[0]=0.;
    pos[1]=0.;
    qeq = new QuilezFunctions();
    gf = new GeoFunctions();
  }

  FibberCircles(float toff){
    bpm = 100;//bpm_;
    spiro = new Spiropath(10,12,-5,10, toff);
    pos = new float[2];
    pos[0]=0.;
    pos[1]=0.;
    qeq = new QuilezFunctions();
  }

  
  void draw() {
    stroke(0.9, 0.8);
    noFill();
    float xoff = 0.;
    float yoff = 0.;
    
    pos = spiro.getPosition(0.);
    if (frameCount < 500) {      
      // f: release
      // k: attack
     xoff = qeq.expSustainedImpulse(1+frameCount,250, 250.0);
     pos[0] *= xoff;
     yoff = qeq.expSustainedImpulse(1+frameCount,250, 250.0);
     pos[1]  *= yoff;
    }
    pushMatrix();
    translate(wMid + pos[0], hMid + pos[1], 0 );
    //spiro.draw();
    float d = 0.618*(0.5*width + pow((sq(pos[0])+sq(pos[1])),0.5));

    pushMatrix();
    //rotate(0.3);

    drawCircle(d, pos[0], pos[1]);
    //draw2Circle(d);
    popMatrix();
    popMatrix();
  }
  
  void draw(PImage img, float offset) {
    stroke(0.9, 0.8);
    noFill();
    float xoff = 0.;
    float yoff = 0.;
    
    pos = spiro.getPosition(offset);
    if (frameCount < 500) {      
      // f: release
      // k: attack
     xoff = qeq.expSustainedImpulse(1+frameCount,250, 250.0);
     pos[0] *= xoff;
     yoff = qeq.expSustainedImpulse(1+frameCount,250, 250.0);
     pos[1]  *= yoff;
    }
    pushMatrix();
    
    GPoint gp1 = new GPoint(0,0);
    GPoint gp2 = new GPoint(pos[0], pos[1]);
    float d = 1 + 0.03*gf.getLen(gp1, gp2);
    //println(d);
    translate(wMid - 0.5*img.width+ pos[0], hMid - 0.5*img.height+ pos[1], 0);
    //spiro.draw();

    pushMatrix();
    //rotate(0.3);

    image(img, pos[0], pos[1], img.width / d , img.height / d);
    
    popMatrix();
    popMatrix();
  }  
  
  void drawCircle(float d, float xoff, float yoff) {
    strokeWeight(d/23);

    circle(0,0,d);
    if (d > 0.0382*width) {
      float offset = 0.0382*d;
      float xoff2 = offset * xoff / sqrt(sq(xoff) + sq(yoff));
      float yoff2 = offset * yoff / sqrt(sq(xoff) + sq(yoff));

      pushMatrix();
      translate(0-xoff2,0-yoff2,0);
      drawCircle(0.618*d, xoff, yoff);
      popMatrix();
    }
  }
}
