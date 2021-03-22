class Pfibbers {
  
Pyramid pyramids;
PImage bgimg;
NoizeBob xbob, ybob;
NoizeBob sbob, cbob;
float loopTimer;
QuilezFunctions qf;
 Pfibbers() {
  
  pyramids = new Pyramid();
      //bgimg = loadImage("pattern11_contrast.png");
  xbob = new NoizeBob(5., 0.1*random(1), 0.5);
  ybob = new NoizeBob(5., 0.1*random(1), 0.5);
  sbob = new NoizeBob(0.1, 0.001, 0.5);
  cbob = new NoizeBob(0.1, 0.001, 0.5);
  loopTimer = 0.;
  qf = new QuilezFunctions();
}

void draw() {
  
  float qff = qf.expStep(frameCount, 0.01, 0.4);
   translate((0.5*width-100) + 200 * qff, (0.5*height-15) - 100 * qff, 0 - 400 * qff);
   pushMatrix();
   float qfRot = qf.expSustainedImpulse(frameCount, 1000, 0.5);
   
   rotateX((0.2*sin(0.003*frameCount + sbob.getBob())) * qfRot);
   rotateY((0.2*cos(0.003*frameCount)+ cbob.getBob()) * qfRot);
   rotateZ(cbob.getBobTail(1) - (1+sin(0.0007*frameCount)));
   pyramids.drawPyramid();
   popMatrix();
    
}
}

class Pyramid {
  
  // 4 sided
 float cX, cY, rad1, rad2, rad3, eB, ph;
 float cYoff, cYinc, cXoff, cXinc;
 float tDelta, tOffset, theta, thetaInc;
 PImage img;
 PShape[] pyramids;
 NoizeBob nbob, sbob, zbob;
 int pcount;
 float vx0, vx1, vx2, vx3, vx4;
 float vy0, vy1, vy2, vy3, vy4;
 float vz0, vz1, vz2, vz3, vz4;
 
 PImage timg;
 
  Pyramid() {
    pcount = 13;
    cX = 0.5 * width;
    cY = 0.5 * height;
    //cX = cY = 0;
    rad1 = 600.0;
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
    zbob.getBob();
    float zbb = qf.expStep(frameCount, 1000, 0.1);
    translate(cX, cY, 0 - 500 * zbb);
    for (int i = 0; i < pcount; i++) {
      pushMatrix();
      //translate(0, 0, 20* zbob.getBobTail(i));
      shape(pyramids[i], nbob.getBob(), nbob.getBob());
      popMatrix();
    }
  }
  
  void drawPyramid() {
    thetaInc = 0.003;
    color(RGB, 100);
    for (int z = 0; z < pcount; z++) {
      pushMatrix();
      translate(0, 0, z *(50+ 0.8*nbob.getBob())- 100);
      rotateZ(0.1*cos((1.+0.5*z)*(theta)));
      scale(constrain(1.-z* 0.3* sbob.getBob(), 0, 1.));      
      for (int i = 0; i < pcount; i++) {        
        float nb = nbob.getBob();
        shape(pyramids[i], nb, nb);
      }
      popMatrix();
    }
    theta+=thetaInc;
  }
  
  void setup() {
    //timg = loadImage("catMarch01.png");
    EmptyTemplate et = new EmptyTemplate();
    timg = et.getEmpty(width, height);
    AutoPalette apal = new AutoPalette(-1.);
    NoizeBob_2D nb = new NoizeBob_2D(1., 0.00001, 0.3);
    zbob = new NoizeBob(1.0, 0.0001, 0.2);
    
    timg.loadPixels();
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
       timg.pixels[x + y*width] = apal.getColor(nb.getBob()); 
       
      }
    }
    timg.updatePixels();
    
    pyramids = new PShape[pcount];
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
    float inc = 0.00006;
    float falloff = 0.4;
    nbob = new NoizeBob(factor, inc, falloff);
    sbob = new NoizeBob(1., 1*inc, falloff);
      
    // color: 20 38 75
    }
  }
}
