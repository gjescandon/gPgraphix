class BullsEye {
  
  AutoPalette apal;
  BezierFlower bf;
  NoizeBob cbob, xbob;
  float fc1, fc2 ,fc3, fc4, fc5;
  float xoff, yoff, yinc;
  BullsEye() {
    apal = new AutoPalette();
    bf = new BezierFlower();
    cbob = new NoizeBob(1.0, 0.001, 0.3);
    xbob = new NoizeBob(50.0, 0.01, 0.3);
    fc1 = random(1);
    fc2 = random(1);
    fc3 = random(1);
    fc4 = random(1);
    fc5 = random(1);
    xoff = (0.2+0.7*random(1.)*width);
    yoff = 1.4* height;//+ random(0.5*height);
    yinc = 0.8 * 0.5*random(1);
  }
  
  void draw() {
    pushMatrix();
    translate(xoff + xbob.getBob(),yoff,0);
    pushMatrix();
    scale(constrain(map(1.-abs(yoff-0.5*height)/(0.5*height),0,1,0.5,1.),0.5,1.));
    bf.draw();
    popMatrix();
    popMatrix();
    yoff -= yinc;
    if (yoff< -height) {
      bf = new BezierFlower();
      xoff = (0.2+0.7*random(1.)*width);
      yoff = 1.4* height;// + random(0.5*height);
      yinc = 0.8 * random(1);
    }
  }
  
}

class BezierFlower {
 float diameter;
 float fc1, fc2, fc3, fc4, fc5;
 AutoPalette apal;
 NoizeBob zbob, xbob, ybob, cbob;
 
 BezierFlower(){
  diameter = (0.2+0.1*random(1))*height;
  fc1 = random(1);
  fc2 = random(1);
  fc3 = random(1);
  fc4 = random(1); 
  fc5 = random(1); 
  apal = new AutoPalette(0.46);
  zbob = new NoizeBob(2.0, 0.0009, 0.4);
  xbob = new NoizeBob(20.0, 0.03, 0.4);
  ybob = new NoizeBob(20.0, 0.03, 0.4);
  cbob = new NoizeBob(1.0, 0.003, 0.4);
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
  zbob.getBob();
   
  for (int i=0; i<pMax;i++){
     float xc1 =(1.6+zbob.getBobTail(i))*diameter*cos(theta+zbob.getBobTail(i)-0.5);
     float yc1 = (1.6+zbob.getBobTail(i))*diameter*sin(theta+zbob.getBobTail(i)-0.5);
     float xc2 = (1.6+zbob.getBobTail(i+1))*diameter*cos(theta+tOff+zbob.getBobTail(i+1)-0.5);
     float yc2 = (1.6+zbob.getBobTail(i+1))*diameter*sin(theta+tOff+zbob.getBobTail(i+1)-0.5);
     float x2 = diameter*cos(theta+tOff);
     float y2 = diameter*sin(theta+tOff);
     bp.bezierVertex(xc1,yc1,xc2,yc2,x2,y2);
     theta += tOff;
  }
  bp.endShape();
      
      pushMatrix();
        rotate(0.0007*frameCount);
        bp.setFill(apal.getColor(fc1 +cbob.getBob()));
        shape(bp,xbob.getBob(),ybob.getBob());

        translate(0,0,1);
        bp.setFill(apal.getColor((10*fc2)+cbob.getBobTail(1)));
        shape(bp,0,0, 2.616*diameter, 2.616 * diameter);
        
        translate(0,0,1);
        bp.setFill(apal.getColor((10*fc3)+cbob.getBobTail(1)));
        shape(bp,0,0, 2.416*diameter, 2.416 * diameter);
        
        translate(0,0,1);
        //bp.setFill(chromaKey);
        bp.setFill(apal.getColor((10*fc4)+cbob.getBobTail(1)));
        shape(bp,0,0, 2.016*diameter, 2.016 * diameter);

        translate(0,0,1);
        //bp.setFill(chromaKey);
        bp.setFill(apal.getColor((10*fc5)+cbob.getBobTail(2)));
        shape(bp,0,0, 1.016*diameter, 1.016 * diameter);

        translate(0,0,1);
        //bp.setFill(chromaKey);
        bp.setFill(apal.getColor((10*fc1)+cbob.getBobTail(3)));
        shape(bp,0,0, .716*diameter, .716 * diameter);

       popMatrix();
  popMatrix();
 }
}
