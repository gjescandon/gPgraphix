class Pyramid {
 float cX, cY, rad1, rad2, rad3, eB, ph;
 float cYoff, cYinc, cXoff, cXinc;
 float tDelta, tOffset, theta, thetaInc;
 PImage img;
 PShape[] pyramids;
 NoizeBob nbob, sbob;
 int pcount;
 float vx0, vx1, vx2, vx3, vx4;
 float vy0, vy1, vy2, vy3, vy4;
 float vz0, vz1, vz2, vz3, vz4;
 
 PImage timg;
 
  Pyramid() {
    pcount = 5;
    cX = 0.5 * width;
    cY = 0.5 * height;
    //cX = cY = 0;
    rad1 = 300.0;
    rad2 = 0.385 * rad1; // (1-1/1.618)   *** golden ratio
    rad3 = 0.235 * rad1; // (1/1.618)* (1-1/1.618)
    ph = -60.;
    
    
    cYoff = cXoff = tOffset = 00;
    tDelta = 0.2 * TWO_PI;
    cXinc = 0.05;
    cYinc = 0.1;
    theta = 0.;
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
    thetaInc = 0.003;
    color(RGB, 100);
    for (int z = 0; z < 5; z++) {
      pushMatrix();
      translate(0, 0, z *(10+ 0.8*nbob.getBob()) - 50.);
      rotateZ(0.1*cos((1.+0.5*z)*(theta)));
      scale(1.-z* 0.3* sbob.getBob());      
      for (int i = 0; i < pcount; i++) {        
        float nb = nbob.getBob();
        shape(pyramids[i], nb, nb);
      }
      popMatrix();
    }
    theta+=thetaInc;
  }
  
  void setup() {
    timg = loadImage("catMarch01.png");

    pyramids = new PShape[5];
    float tDelta = 0.4*PI;
    float tOffset = 0.1*PI;
    float tOffset2 = 0.1*PI - 0.5 * tDelta;
    for (int i = 0; i < pcount; i++) {
      vx0 = 0.;
      vy0 = 0.;
      vz0 = 0.;
      
      vx1 = floor(rad2 * cos((i-1)*tDelta - tOffset2 ));
      vy1 = floor(rad2 * sin((i-1)*tDelta - tOffset2));
      vz1 = 0.;
      
      vx2 = floor(rad3 * cos(i*tDelta - tOffset ));
      vy2 = floor(rad3 * sin(i*tDelta - tOffset));
      vz2 = ph;

      vx3 = floor(rad1 * cos(i*tDelta - tOffset));
      vy3 = floor(rad1 * sin(i*tDelta - tOffset));
      vz3 = 0.;

      vx4 = floor(rad2 * cos(i*tDelta - tOffset2 ));
      vy4 = floor(rad2 * sin(i*tDelta - tOffset2));
      vz4 = 0.;

      float timgW = 0.6*timg.width;
      float timgH = 0.9*timg.height;

      PShape dp = createShape();
      dp.beginShape();
      //stroke(0,50, 100);
      dp.noStroke();
      dp.texture(timg);
      dp.vertex(vx0, vy0, vz0, 0, timgH);
      dp.vertex(vx1, vy1, vz1, timgW, timgH);
      dp.vertex(vx2, vy2, vz2, 0.5*timgW, 0); 

      dp.vertex(vx1, vy1 , vz1, 0, timgH);
      dp.vertex(vx3, vy3, vz3, timgW, timgH);
      dp.vertex(vx2, vy2, vz2, 0.5*timgW, 0);  

      dp.vertex(vx3, vy3, vz3, 0-timgW/timgH, timgH);
      dp.vertex(vx4, vy4,vz4, timgW/timgH, timgH);
      dp.vertex(vx2, vy2, vz2, 0.5*timgW, 0); 

      dp.vertex(vx4, vy4,vz4, 0-timgW/timgH, timgH);
      dp.vertex(vx0, vy0, vy0, timgW/timgH, timgH);
      dp.vertex(vx2, vy2, vz2, 0.5*timgW, 0); 
      

      dp.endShape(CLOSE);
      pyramids[i] = dp;
      
    float factor = 50.;
    float inc = 0.0006;
    float falloff = 0.4;
    nbob = new NoizeBob(factor, inc, falloff);
    sbob = new NoizeBob(1., 1*inc, falloff);
      
    // color: 20 38 75
    }
  }
}
