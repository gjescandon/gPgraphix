PImage nuImg;

NoizeBob zBob;
NoizeBob_2D yBob;
QuilezFunctions qeq;
AutoPalette apal;
color bc;
float fc1, fc2, fc3, fc4;
float wOff, hOff, diameter; 
PImage img;
BobbleBoxPistil bbPistil;
color chromaKey;
//****
boolean saveFrame = true;
//****

void setup() {
  size(1280,720, P3D);
  colorMode(HSB, 1.);
  
  chromaKey = color(0.4,1.0,1.0);
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  zBob = new NoizeBob(1., 0.006, 0.4);
  yBob = new NoizeBob_2D(200., 0.003, 0.7);
  apal = new AutoPalette(random(1));
  bc = apal.getColor(random(1));
  fc1 = random(1);
  fc2 = random(1);
  fc3 = random(1);
  fc4 = random(1);
  qeq = new QuilezFunctions();
  wOff = 0.5*width;
  hOff = 0.5*height;
  diameter = 0.23*width;
  img = loadImage("catMarch01.png");
  
  bbPistil = new BobbleBoxPistil();
}

void draw() {
  //background(apal.getColor(0.0001*frameCount));
  background(chromaKey);
        
  int dmax = 8;
  float bw = 1.*width/dmax;

  bbPistil.draw();

  zBob.getBob();
  yBob.getBob();

  translate(wOff, hOff);
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
  if (saveFrame) saveFrame();
  println(frameCount);
}
