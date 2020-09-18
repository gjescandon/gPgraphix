class DancingStar {
 float cX, cY, rad1, rad2, eA, eB;
 float cYoff, cYinc, cXoff, cXinc;
 float tDelta, tOffset, thetaInc;
 PImage img;
 
  DancingStar() {
    cX = 0.5 * width;
    cY = 0.5 * height;
    rad1 = 300.0;
    rad2 = 0.385 * rad1;
    //eA = rad1 * ( 3.0 + random(1));
    //eB = rad1 * ( 2.0 + random(1));
    
    cYoff = cXoff = tOffset = 00;
    tDelta = 0.2 * TWO_PI;
    cXinc = 0.05;
    cYinc = 0.1;
    thetaInc = 0.1;
  }
  
  void draw() {
    PShape dstar = createShape();
    stroke(0,0,0);    
    dstar.beginShape();
    float tDelta = 0.4*PI;
    float tOffset = 0.1*PI;
    float tOffset2 = 0.1*PI - 0.5 * tDelta;
    for (int i = 0; i < 5; i++) {
      
      dstar.vertex(cX + rad1 * cos(i*tDelta - tOffset), cY + rad1 * sin(i*tDelta - tOffset));
      dstar.vertex(cX + rad2 * cos(i*tDelta - tOffset2 ), cY + rad2 * sin(i*tDelta - tOffset2));
    }
    dstar.endShape(CLOSE);    
    shape(dstar, 0, 0);
  }
}
