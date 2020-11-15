class FlockBox{

  PShape[] flock;
  int fs = 156;
  PImage sunImg = loadImage("sunflowerAbs72.jpg");
  EmptyTemplate et = new EmptyTemplate();
  Spirograph spiro;
  AutoPalette apal = new AutoPalette();

  FlockBox(){
   init(); 
   
   //spiro = new Spirograph(10, 13, -5, 10); // 3 pedals  
   //spiro = new Spirograph(10,  13,  -8,  10); // 9 pedals
    spiro = new Spirograph(10,  12,  -25,  10); // 7 pedals
    //spiro = new Spirograph(10, 11 ,-14, 10); // 12 
     
    
  }
  
  void drawBasic1(){
    circle(10,10,100);
    translate(0.5*width, 0.5*height, 0);
    float rOff = (0.5 + 0.5* sin(0.01*frameCount));
    float xOff = 0.4*width*rOff;
    pushMatrix();
    rotateZ(3.*sin(0.006*frameCount));
    pushMatrix();
    translate(xOff, 0 , 0);
    pushMatrix();
    rotateY(map(rOff,0,1.0,-HALF_PI,0));
    pushMatrix();
    rotateX(0.01*frameCount);
    

    shape(flock[0],0,0,100,10);
    popMatrix();
    popMatrix();
    popMatrix();
    popMatrix();
  }

  
  void drawBasic2(){

    translate(0.5*width, 0.5*height, 0);
    float tOff = TWO_PI/fs;
    for (int i = 0; i < fs; i++) {
      float fi = 1.0*i;
      float rOff = (0.5 + 0.5* sin(0.01*frameCount));
      float xOff = 0.4*width*(0.05+rOff);
      pushMatrix();
      rotateZ(3.*sin(0.006*frameCount+ i*tOff) + 0.0006*frameCount );
      pushMatrix();
      translate(xOff, 0 , 0);
      pushMatrix();
      rotateY(map(rOff,0,1.0,-HALF_PI,0));
      pushMatrix();
      rotateX(0.01*frameCount);
      shape(flock[0],0,0,100,20);
      popMatrix();
      popMatrix();
      popMatrix();
      popMatrix();
    }
  }

  void drawSpiro(){
    
    //image(getPim(),0,0,100,100);
    //apal.test();
    
    translate(0.5*width, 0.5*height, 0);
    
    float tOff = 0.4*PI/fs;
    
    float rmin = 1000.;
    float rmax = 0.;
    for (int i = 0; i < fs; i++) {
      float[] sp = spiro.getPoint(i*tOff + 0.00003*frameCount);
      float rOff = 2.;//(0.5 + 0.5* sin(0.01*frameCount));
      float xOff = sp[0]*(0.05+rOff);
      float yOff = sp[1]*(0.05+rOff);
      float r0ff = (sq(xOff) + sq(yOff)) / (0.4 * height);
      float theta = 0;
      
      // getTheta
      theta = atan(yOff/xOff);
      if (xOff < 0) theta = PI+theta;
      
      pushMatrix();
        rotateZ(theta);      
      pushMatrix();
      translate(xOff, yOff , 0);
      pushMatrix();
      rotateY(map(xOff,-250,250.,-0.25*PI, .25*PI));
      rotateX(map(yOff,-250,250.,0.25*PI, -0.25*PI));
      
      pushMatrix();
        rotateZ(theta);      
      shape(flock[i],0,0,10,10);
      popMatrix();
      popMatrix();
      popMatrix();
      popMatrix();
    }
  }
  
  void init(){
    
    flock = new PShape[fs];
    for (int i = 0; i < fs; i++) {
      PShape fb = createShape();
      PImage pim = getPim();
      
      fb.beginShape(QUADS);
      fb.noStroke();
      fb.texture(pim);
      
      float cf = 3.0 * i / fs;
      fb.fill(apal.getColor50(cf));
      // +Z "front" face
      fb.vertex(-10, -10,  100, 0, 0);
      fb.vertex( 10, -10,  100, 0, 1);
      fb.vertex( 10,  10,  100, 1, 1);
      fb.vertex(-10,  10,  100, 1, 0);
    

      // -Z "back" face
      fb.vertex( 10, -10, -100, 1, 1);
      fb.vertex(-10, -10, -100, 1, 0);
      fb.vertex(-10,  10, -100, 0, 0);
      fb.vertex( 10,  10, -100, 0, 1);
    
    
      // +Y "bottom" face
      fb.vertex(-10,  10,  100, 0, 0);
      fb.vertex( 10,  10,  100, 0, 1);
      fb.vertex( 10,  10, -100, 1, 1);
      fb.vertex(-10,  10, -100, 1, 0);

      // -Y "top" face
      fb.vertex(-10, -10, -100, 0, 0);
      fb.vertex( 10, -10, -100, 0, 1);
      fb.vertex( 10, -10,  100, 1, 1);
      fb.vertex(-10, -10,  100, 1, 0);
    
      // +X "right" face
      fb.vertex( 10, -10,  100, 0, 0);
      fb.vertex( 10, -10, -100, 0, 1);
      fb.vertex( 10,  10, -100, 1, 1);
      fb.vertex( 10,  10,  100, 1, 0);

            // -X "left" face
      fb.vertex(-10, -10, -100, 1, 0);
      fb.vertex(-10, -10,  100, 0, 0);
      fb.vertex(-10,  10,  100, 0, 1);
      fb.vertex(-10,  10, -100, 1, 1);


      fb.endShape();
      flock[i] = fb;
    }
    
  }
  
  PImage getPim() {
    sunImg.loadPixels();
    PImage pim = et.getEmpty(20,20);
    pim.loadPixels();
    int x0 = floor(random(sunImg.width - 100));
    int y0 = floor(random(sunImg.height - 100));
    
    for (int j = 0; j <20; j++) {
      for (int i=0; i < 20; i++) {
        color cc = sunImg.pixels[x0 + i + (y0 + j)*width];
        pim.pixels[i + j*20] = cc;
      }
    }

    pim.updatePixels();
    return pim;
  }
    
}
