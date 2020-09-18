class DancingPyramid {
 float cX, cY, rad1, rad2, eA, eB;
 float cYoff, cYinc, cXoff, cXinc;
 float tDelta, tOffset, thetaInc;
 PImage img;
 PShape[] pyramids;
 NoizeBob nbob;
 
  DancingPyramid() {
    cX = 0.5 * width;
    cY = 0.5 * height;
    //cX = cY = 0;
    rad1 = 300.0;
    rad2 = 0.385 * rad1;
    //eA = rad1 * ( 3.0 + random(1));
    //eB = rad1 * ( 2.0 + random(1));
    
    cYoff = cXoff = tOffset = 00;
    tDelta = 0.2 * TWO_PI;
    cXinc = 0.05;
    cYinc = 0.1;
    thetaInc = 0.1;
    setup();
  }
  
  void draw() {
    translate(cX, cY);
    for (int i = 0; i < 5; i++) {
      shape(pyramids[i], nbob.getBob(), nbob.getBob());
    }
  }
  
  void drawPyramid() {
    color(RGB, 100);
    for (int z = 0; z < 10; z++) {
      pushMatrix();
      translate(0, 0, z *(10+ 0.8*nbob.getBob()));
      scale(1.-z*0.06);
      for (int i = 0; i < 5; i++) {
        pyramids[i].setStroke(color(20,38,75));
        pyramids[i].setFill(color(100,100,100));
        float nb = nbob.getBob();
        shape(pyramids[i], nb, nb);
      }
      popMatrix();
    }
  }
  
  void setup() {
    pyramids = new PShape[5];
    float tDelta = 0.4*PI;
    float tOffset = 0.1*PI;
    float tOffset2 = 0.1*PI - 0.5 * tDelta;
    for (int i = 0; i < 5; i++) {
      PShape dp = createShape();
      dp.beginShape();
      stroke(0,0,0);        
      fill(0,0,0);        
      dp.vertex(0,0);
      dp.vertex(rad2 * cos((i-1)*tDelta - tOffset2 ), rad2 * sin((i-1)*tDelta - tOffset2));      
      dp.vertex(rad1 * cos(i*tDelta - tOffset), rad1 * sin(i*tDelta - tOffset));
      dp.vertex(rad2 * cos(i*tDelta - tOffset2 ), rad2 * sin(i*tDelta - tOffset2));

      dp.endShape(CLOSE);
      pyramids[i] = dp;
      
    float factor = 50.;
    float inc = 0.0006;
    float falloff = 0.3;
    nbob = new NoizeBob(factor, inc, falloff);
      
    // color: 20 38 75
    }
  }
}
