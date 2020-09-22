class FibberCircles {
 int bpm;
  
  FibberCircles(int bpm_){
    bpm = bpm_;
  }
  
  void draw() {
    stroke(0.);
    strokeWeight(4);
    noFill();
    translate(wMid, hMid,0);
    float d = 0.618*0.5*width;
    pushMatrix();
    //rotate(0.3);
    drawCircle(d);
    draw2Circle(d);
    popMatrix();
    
  }
  
  void drawCircle(float d) {
    circle(0,0,d);
    if (d > 0.0618*width) {
      drawCircle(0.618*d);
    }
  }

  void draw2Circle(float d) {
    pushMatrix();
    draw2CircleBottom(d,0);
    popMatrix();
    pushMatrix();
    draw2CircleTop(d,0);
    popMatrix();
  }
  void draw2CircleBottom(float d, float zoff) {
    circle(0.5*wMid,0.5*hMid ,d);
    if (d > 0.0618*width) {
      translate(0-0.0382*d,0-0.0382*d, zoff);
      draw2CircleBottom(0.618*d, zoff);
    }
  }
  void draw2CircleTop(float d, float zoff) {
    circle(0-0.5*wMid,0-0.5*hMid ,d);
    if (d > 0.0618*width) {
      translate(0.0382*d,0.0382*d, zoff);
      draw2CircleTop(0.618*d, zoff);
    }
  }
}
