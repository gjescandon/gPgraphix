class BullsEye {
  
  AutoPalette apal;
  BezierFlower bf;
  
  BullsEye() {
    apal = new AutoPalette();
    bf = new BezierFlower();
  }
  
  void draw() {
    float d= 0.3*height;
    float fcOff = 0.001*frameCount;
    pushMatrix();
    translate(d,d,0);
    bf.draw();
    popMatrix();
    
  }
  
}

class BezierFlower {
 float diameter;
 float fc1, fc2, fc3, fc4;
 AutoPalette apal;
 BezierFlower(){
   diameter = 0.67*height;
  fc1 = random(1);
  fc2 = random(1);
  fc3 = random(1);
  fc4 = random(1); 
  apal = new AutoPalette();
 }
 
 void draw() {
  pushMatrix();
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
      
      pushMatrix();
        rotate(0.0009*frameCount);
        bp.setFill(apal.getColor(fc1 + 0.0009*frameCount));
        shape(bp,0,0);

        translate(0,0,1);
        bp.setFill(apal.getColor(fc2 + 0.0008*frameCount));
        shape(bp,0,0, 2.616*diameter, 2.616 * diameter);
        
        translate(0,0,1);
        bp.setFill(apal.getColor(fc3 + 0.0007*frameCount));
        shape(bp,0,0, 2.416*diameter, 2.416 * diameter);
        
        translate(0,0,1);
        //bp.setFill(chromaKey);
        bp.setFill(apal.getColor(fc4 + 0.0009*frameCount));
        shape(bp,0,0, 2.016*diameter, 2.016 * diameter);

       popMatrix();
  popMatrix();
 }
}
