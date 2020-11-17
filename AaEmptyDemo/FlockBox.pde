class FlockBox{

  PShape[] flock;
  int fs = 3;
  
  FlockBox(){
   init(); 
  }
  
  void draw(){
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
  
  void init(){
    
    flock = new PShape[3];
    for (int i = 0; i < fs; i++) {
      PShape fb = createShape();
      fb.beginShape(QUADS);
      fb.setStroke(color(0.0));
      fb.setFill(color(0.3));
      
      // -X "left" face
      fb.vertex(-10, -10,  10);
      fb.vertex(-10,  10,  10);
      fb.vertex(-10,  10, -10);
      fb.vertex(-10, -10, -10);

            // +Z "front" face
      fb.vertex(-10, -10,  10);
      fb.vertex( 10, -10,  10);
      fb.vertex( 10,  10,  10);
      fb.vertex(-10,  10,  10);
    
      // +Y "bottom" face
      fb.vertex(-10,  10,  10);
      fb.vertex( 10,  10,  10);
      fb.vertex( 10,  10, -10);
      fb.vertex(-10,  10, -10);

      // -Z "back" face
      fb.vertex(-10,  10, -10);
      fb.vertex( 10,  10, -10);
      fb.vertex( 10, -10, -10);
      fb.vertex(-10, -10, -10);
    
    
      // -Y "top" face
      fb.vertex(-10, -10, -10);
      fb.vertex( 10, -10, -10);
      fb.vertex( 10, -10,  10);
      fb.vertex(-10, -10,  10);
    
      // +X "right" face
      fb.vertex( 10, -10,  10);
      fb.vertex( 10, -10, -10);
      fb.vertex( 10,  10, -10);
      fb.vertex( 10,  10,  10);
    
      
      fb.endShape(CLOSE);
      flock[i] = fb;
    }
    
  }
}
