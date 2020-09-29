PImage nuImg;

NoizeBob zBob;
NoizeBob_2D yBob;
QuilezFunctions qeq;
AutoPalette apal;
color bc;
color fc1, fc2, fc3;
float wOff, hOff, diameter; 

void setup() {
  size(720,720, P3D);
  colorMode(HSB, 1.);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  zBob = new NoizeBob(1., 0.006, 0.4);
  yBob = new NoizeBob_2D(200., 0.003, 0.7);
  apal = new AutoPalette(random(1));
  bc = apal.getColor(random(1));
  fc1 = apal.getColor(random(1));
  fc2 = apal.getColor(random(1));
  fc3 = apal.getColor(random(1));
  qeq = new QuilezFunctions();
  wOff = 0.5*width;
  hOff = 0.5*height;
  diameter = 0.191*width;
}

void draw() {
  background(bc);
  int dmax = 8;
  float bw = 1.*width/dmax;
  zBob.getBob();
  yBob.getBob();
  
  translate(wOff, hOff);
  pushMatrix();
  //circle(0,0,diameter);
  PShape bp;
  
  int pMax = 6;
  float tOff = TWO_PI/pMax;
  float theta = 0.;
  bp = createShape();
  bp.beginShape();
  bp.vertex(diameter,0);
  float ctrl = zBob.getBob();
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
        rotate(0.003*frameCount);
        bp.setFill(fc1);
        shape(bp,0,0);

        translate(0,0,2);
        bp.setFill(fc2);
        shape(bp,0,0, 2.616*diameter, 2.616 * diameter);
        
        translate(0,0,2);
        bp.setFill(fc3);
        shape(bp,0,0, 2.416*diameter, 2.416 * diameter);
        
        translate(0,0,2);
        bp.setFill(fc1);
        shape(bp,0,0, 2.016*diameter, 2.016 * diameter);

       popMatrix();
  popMatrix();
 
}
