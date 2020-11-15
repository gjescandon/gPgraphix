class BullsEye {
  
  AutoPalette apal;
  BezierFlower[] bf;
  int bfc = 5;

  BullsEye() {
    apal = new AutoPalette();
    bf = new BezierFlower[bfc];
    
    for (int i = 0; i < bfc; i++) {
     bf[i] = new BezierFlower(); 
    }
  }
  
  void draw() {
    for (int i = 0; i < bfc; i++) {
     pushMatrix();
     translate(0,0,0-i);
     bf[i].draw();
     popMatrix();
    }
    
    
  }
  
}

class BezierFlower {
 float diameter;
 float fc1, fc2, fc3, fc4;
 NoizeBob zBob;
 NoizeBob_2D yBob;
 AutoPalette apal;
 float bfx, bfy, bfyInc;
 
 BezierFlower(){
   diameter = 0.3*height;
  fc1 = random(1);
  fc2 = random(1);
  fc3 = random(1);
  fc4 = random(1); 
  apal = new AutoPalette();
  zBob = new NoizeBob(1., 0.006, 0.4);
  yBob = new NoizeBob_2D(200., 0.003, 0.7);
  bfx = 200.0+random(width-400);
  bfy = height+1.5*diameter;
  bfyInc = 0.5*(1.0+random(1.0));
 }
 
 void draw() {
  
  pushMatrix();
  translate(bfx, bfy, 0);
  //sphere(0.5*diameter);
  PShape bp;
  
  int pMax = 6;
  float tOff = TWO_PI/pMax;
  float theta = 0.;
  bp = createShape();
  bp.beginShape();
  bp.vertex(diameter,0);
  zBob.getBob();
  for (int i=0; i<pMax;i++){
     float xc1 =(1.6+zBob.getBobTail(i))*diameter*cos(theta+zBob.getBobTail(i)-0.5);
     float yc1 = (1.6+zBob.getBobTail(i))*diameter*sin(theta+zBob.getBobTail(i)-0.5);
     float xc2 = (1.6+zBob.getBobTail(i+1))*diameter*cos(theta+tOff+zBob.getBobTail(i+1)-0.5);
     float yc2 = (1.6+zBob.getBobTail(i+1))*diameter*sin(theta+tOff+zBob.getBobTail(i+1)-0.5);
     float x2 = diameter*cos(theta+tOff);
     float y2 = diameter*sin(theta+tOff);
      bp.bezierVertex(xc1,yc1,xc2,yc2,x2,y2);
       theta += tOff;
  }
  bp.endShape();
      float scale = 2.916*diameter*map(bfy,0.0,height,0.3,1.0);
      pushMatrix();
        rotate(0.0009*frameCount);
        
        bp.setFill(apal.getColor(fc1 + 0.0009*frameCount));
        shape(bp,0,0,scale, scale);

        translate(0,0,1);
        bp.setFill(apal.getColor(fc2 + 0.0008*frameCount));
        scale = 2.616*diameter*map(bfy,0.0,height,0.3,1.0);
        shape(bp,0,0, scale, scale);
        
        translate(0,0,1);
        bp.setFill(apal.getColor(fc3 + 0.0007*frameCount));
        scale = 2.416*diameter*map(bfy,0.0,height,0.3,1.0);
        shape(bp,0,0, scale, scale);
        
        translate(0,0,1);
        //bp.setFill(chromaKey);
        bp.setFill(apal.getColor(fc4 + 0.0009*frameCount));
        scale = 2.016*diameter*map(bfy,0.0,height,0.3,1.0);
        shape(bp,0,0, scale, scale);

        translate(0,0,1);
        //bp.setFill(chromaKey);
        bp.setFill(apal.getColor(fc3 + 0.0007*frameCount));
        scale = 1.786*diameter*map(bfy,0.0,height,0.3,1.0);
        shape(bp,0,0, scale, scale);

        translate(0,0,1);
        //bp.setFill(chromaKey);
        bp.setFill(apal.getColor(fc4 + 0.0009*frameCount));
        scale = 1.546*diameter*map(bfy,0.0,height,0.3,1.0);
        shape(bp,0,0, scale, scale);

       popMatrix();
  popMatrix();
  bfy -= bfyInc;
  if (bfy < -0.5*diameter) bfy = height+1.5*diameter;
 }
}
