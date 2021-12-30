class JdUnit {
  
 AutoPaletteRGB apal;
 float coff;
 Jdo[] jdo;
 float[] swArr;
 int[] jdoClock;
 int[] jdoStartPoint;
 int jdoSize = 13;
 QuilezFunctions qf;
 NoizeBob sbob;
 
   float x0  = 0.05*width;
   float y0 = 0.05*height;
   float wmax = 0.95*width;
   float hmax = 0.95*height;
   float aspectX = 16.;
   float aspectY = 9.;
   
   
 JdUnit(){
   apal = new AutoPaletteRGB();
   coff = random(1);
   qf = new QuilezFunctions();
   setup();
 }
 
 void draw() {
  //if (frameCount%500==0) setup();

  for (int i =0; i< jdoSize; i++) {
    float cc = (coff + 1.*i / jdoSize) * (1. + 0.5* sin(0.001* frameCount));
    fill(apal.getColor(cc));
    //stroke(apal.getColor(cc));
    //strokeWeight(20.*sbob.getBob());
    //strokeCap(ROUND);
    //strokeJoin(ROUND);
    noStroke();
    pushMatrix();
    float ss = 1.;
    
    float ss1 = qf.expSustainedImpulse(1.*(frameCount-jdoStartPoint[i]),50., 1.);
    float ss2 = qf.expStep(1.1*(frameCount-jdoStartPoint[i])/jdoClock[i], 40., 8. );
    if (ss2 <= 0.05) {
       //if(i==0) {
       //  jdo[i] = getJdoFrame(floor(random(6)));
       //}
       jdo[i] = getJdo(floor(random(6)));
       if (random(1) > 0.99) jdo[i] = defineTriangleByAspect(16.,9.);
       jdoClock[i] = 1000 + floor(random(300));
       jdoStartPoint[i] = frameCount;
      }
    ss = ss1 * ss2;
    
    //drawSq1(new Jdo(x0,y0,wmax, 2*y0),1.0);
    //drawSq1(new Jdo(wmax-x0-x0,y0,wmax-x0, 2*y0),1.0);
    
    switch(floor(jdo[i].getVals()[0])) {
    case 0: 
      //println("Alpha");  // Does not execute
      break;
    case 1: 
      drawSq1(jdo[i], ss);  // Prints "sq"
      break;
    case 2: 
      drawTri2(jdo[i], ss);  // Prints "tri"
      break;
    case 3: 
      drawCircle3(jdo[i], ss);  // Prints "circ"
      break;
    default:
      //println("Zulu");   // Does not execute
      break;
    }
    popMatrix();
  }
 }
 
 void drawCircle3(Jdo jdo, float ss) {
   float[] val = jdo.getVals();
   circle(val[1],val[2], ss * val[3]);
 }
 
 void drawSq1(Jdo jdo, float ss) {
   float[] val = jdo.getVals();
   rect(val[1],val[2],ss * (val[3]-val[1]), ss* (val[4]-val[2]));
 }
 
 void drawTri2(Jdo jdo, float ss) {
   float[] val = jdo.getVals();
   
   triangle(val[1],val[2],map(ss, 0., 1., val[1], val[3]), map(ss, 0., 1., val[2], val[4]), map(ss, 0., 1., val[1], val[5]), map(ss, 0., 1., val[2], val[6]));
   
 }
 
 void setup() {
   jdo = new Jdo[jdoSize]; 
   
   swArr = new float[jdoSize];
   jdoClock = new int[jdoSize];
   jdoStartPoint = new int[jdoSize];
   sbob = new NoizeBob(1.0, 0.003, 0.7);
   
   for (int i = 0; i < jdo.length; i++) {
    jdo[i] = new Jdo(0); 
    swArr[i] = random(10);
    jdoStartPoint[i] = 0;
    jdoClock[i] = 1000 + floor(random(300));
    if(swArr[i]<1.)swArr[i]=0.;

 }

   
   float a = x0;
   float b = y0;
   float c = wmax;
   float d = hmax;
   jdo[0] = new Jdo(1,a,b,c,d);
   
   //possible triangle points : 16:9
   if (random(1) > 0.6)
     jdo[1] = defineTriangleByAspect(16.,9.);

   for (int i = 2; i < jdoSize; i++) {
     int sw = floor(10* random(1));
     
     jdo[i] = getJdo(sw);
   }
      
 }
 
 Jdo getJdo(int index) {
   Jdo jdoX = new Jdo(0);
     switch (index) {
       case 0:
         break;
       case 1:
         jdoX = defineRectByAspect(4.,3.);
         break;
       case 2:
         jdoX = defineRectByAspect(4.,6.);
         break;
       case 3:
         jdoX = defineTriangleByAspect(8.,9.);
         break;
       case 4:
         jdoX = defineTriangleByAspect(4.,6.);
         break;
       case 5:
         jdoX = defineCircle(1.5);
         break;
       case 6:
         jdoX = defineCircle(2);
         break;
       default:
         break;
     }
   return jdoX;
 }
 
 Jdo getJdoFrame(int index) {
   Jdo jdoX = new Jdo(0);
     switch (index) {
       case 0:
         break;
       case 1:
         jdoX = defineRectByAspect(8.,3.);
         break;
       case 2:
         jdoX = defineRectByAspect(8.,6.);
         break;
       case 3:
         jdoX = defineRectByAspect(8.,9.);
         break;
       case 4:
         jdoX = defineRectByAspect(2.,6.);
         break;
       case 5:
         jdoX = defineRectByAspect(2.,8.);
         break;
       case 6:
         jdoX = defineRectByAspect(2.,5.);
         break;
       default:
         break;
     }
   return jdoX;
 }
 
 Jdo defineCircle(float radInc) {

   // radInc is radius units 
   // must be less than height aspect
   
   float type = 3; // circle type 3;
   float xoff = 0;
      xoff = (wmax / aspectX)*floor(random(aspectX -1));
      xoff = (wmax / aspectX)*floor(random(aspectX ));
    float yoff = 0;
      yoff = (hmax / aspectY)*floor(random(aspectY -1));
      yoff = (hmax / aspectY)*floor(random(aspectY ));
    
    float x1 = 2.*x0 + xoff; 
    float y1 = 2.*y0 + yoff;
    float rad = hmax / radInc;
   return new Jdo(type,x1, y1, rad); 
 }
 
 Jdo defineRectByAspect(float xinc, float yinc) {
    float type = 1.; // rect type 1
    
    if (random(1) < 0.5) {
     xinc = yinc;
     yinc = xinc;
    }
    float xoff = 0;
    if (xinc < aspectX) 
      xoff = (wmax / aspectX)*floor(random((aspectX-xinc) ));
    float yoff = 0;
    if (yinc < aspectY)
      yoff = (hmax / aspectY)*floor(random((aspectY-yinc) ));
    float a = x0 + xoff; 
    float b = y0 + yoff;

   float c = wmax * xinc / aspectX;
   float d = hmax * yinc / aspectY;
   return new Jdo(type,a,b,c,d); 
 }

  Jdo defineTriangleByAspect(float xinc, float yinc) {

    float xoff = 0;
    if (xinc < aspectX) 
      xoff = (wmax / aspectX)*floor(random((aspectX-xinc) ));
    float yoff = 0;
    if (yinc < aspectY)
      yoff = (hmax / aspectY)*floor(random((aspectY-yinc) ));
    float x1 = x0 + xoff; 
    float y1 = y0 + yoff;
    float x2 = wmax / (aspectX/xinc) + xoff;
    float y2 = y1;
    float x3 = x2;
    float y3 = hmax / (aspectY/yinc) + yoff;
    float x4 = x1;
    float y4 = y3;

   // using 4 points to allow for rotated permutations
   float type = 2; // triagle type 2;
   
      ArrayList<GPoint> parr = new ArrayList<GPoint>();
   parr.add(new GPoint(x1,y1));
   parr.add(new GPoint(x2,y2));
   parr.add(new GPoint(x3,y3));
   parr.add(new GPoint(x4,y4));
   
   int ii = floor(random(parr.size()));
   GPoint p1 = parr.get(ii);
   parr.remove(ii);
   int ii2 = floor(random(parr.size()));
   GPoint p2 = parr.get(ii2);
   parr.remove(ii2);
   int ii3 = floor(random(parr.size()));
   GPoint p3 = parr.get(ii3);
   // random rotate
   return new Jdo(type,p1.getX(), p1.getY(), p2.getX(), p2.getY(), p3.getX(), p3.getY()); 
 }

}

class Jdo {
  
 // JenDu object
 float[] val;

   // val[0] : type
   // 1 = rect
   // 2 = triangle
   // 3 = circle
   // 0 = no object : do nothing
   // remaining val are xy coord pairs
   // rect: 2 pairs
   // tri: 3 pairs
   // circle 1 pair + radius

 Jdo(float type) {
   val = new float[10];
   val[0] = type; // expecting 0
 }
 Jdo(float type, float x1, float y1, float x2, float y2) {
   val = new float[10];
   val[0] = type; // expecting 1 square
   val[1] = x1;
   val[2] = y1;
   val[3] = x2;
   val[4] = y2;

 }
 Jdo(float type, float x1, float y1, float x2, float y2, float x3, float y3) {
   val = new float[10];
   val[0] = type; // expectin 2 triangle
   val[1] = x1;
   val[2] = y1;
   val[3] = x2;
   val[4] = y2;
   val[5] = x3;
   val[6] = y3;
 }
 Jdo(float type, float x1, float y1, float rad) {
   val = new float[10];
   val[0] = type; // expectin 3
   val[1] = x1;
   val[2] = y1;
   val[3] = rad;
 }
 
 float[] getVals() {
   return val;
 }
}
