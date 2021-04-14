class JdUnit {
  
 AutoPaletteRGB apal;
 float coff;
 Jdo[] jdo;
 float[] swArr;
 
 int jdoSize = 13;
 
   float x0  = 0.1*width;
   float y0 = 0.1*height;
   float wmax = 0.9*width;
   float hmax = 0.9 * height;
   float aspectX = 16.;
   float aspectY = 9.;
 JdUnit(){
   apal = new AutoPaletteRGB();
   coff = random(1);
   setup();
 }
 
 void draw() {
  if (frameCount%250==0) setup();
  
  for (int i =0; i< jdoSize; i++) {
    fill(apal.getColor((coff + i* 0.2) * (0.5 + 0.5* sin(0.001* frameCount))));
    noStroke();
    
     switch(floor(jdo[i].getVals()[0])) {
    case 0: 
      //println("Alpha");  // Does not execute
      break;
    case 1: 
      drawSq1(jdo[i]);  // Prints "Bravo"
      break;
    case 2: 
      drawTri2(jdo[i]);  // Prints "Bravo"
      break;
    case 3: 
      drawCircle3(jdo[i]);  // Prints "Bravo"
      break;
    default:
      //println("Zulu");   // Does not execute
      break;
    }
  }
 }
 
 void drawCircle3(Jdo jdo) {
   float[] val = jdo.getVals();
   circle(val[1],val[2],val[3]);
 }
 
 void drawSq1(Jdo jdo) {
   float[] val = jdo.getVals();
   rect(val[1],val[2],val[3]-val[1],val[4]-val[2]);
 }
 
 void drawTri2(Jdo jdo) {
   float[] val = jdo.getVals();
   triangle(val[1],val[2],val[3],val[4],val[5],val[6]);
   
 }
 
 void setup() {
   jdo = new Jdo[jdoSize]; 
   
   swArr = new float[jdoSize];
   
   for (int i = 0; i < jdo.length; i++) {
    jdo[i] = new Jdo(0); 
    swArr[i] = random(10);
    if(swArr[i]<1.)swArr[i]=0.;
    println(swArr[i]);
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
     Jdo jdoX = new Jdo(0);
     switch (sw) {
       case 0:
         jdoX = defineTriangleByAspect(8.,9.);
         break;
       case 1:
         jdoX = defineTriangleByAspect(8.,6.);
         break;
       case 2:
         jdoX = defineTriangleByAspect(4.,6.);
         break;
       case 3:
         jdoX = defineRectByAspect(4.,3.);
         break;
       case 4:
         jdoX = defineRectByAspect(4.,6.);
         break;
       case 5:
         jdoX = defineCircle(7);
         break;
       case 6:
         jdoX = defineCircle(3);
         break;
       default:
         break;
     }
     jdo[i] = jdoX;
   }
      
 }
 
 Jdo defineCircle(float radInc) {

   // radInc is radius units 
   // must be less than height aspect
   
   float type = 3; // circle type 3;
   float xoff = 0;
      xoff = (wmax / aspectX)*floor(random(aspectX -1));
    float yoff = 0;
      yoff = (wmax / aspectY)*floor(random(aspectY -1));
    
    float x1 = x0 + xoff; 
    float y1 = y0 + yoff;
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
      xoff = (wmax / aspectX)*floor(random((aspectX-xinc) -1));
    float yoff = 0;
    if (yinc < aspectY)
      yoff = (wmax / aspectY)*floor(random((aspectY-yinc) -1));
    float a = x0 + xoff; 
    float b = y0 + yoff;

   float c = wmax * xinc / aspectX;
   float d = hmax * yinc / aspectY;
   return new Jdo(type,a,b,c,d); 
 }

  Jdo defineTriangleByAspect(float xinc, float yinc) {

    float xoff = 0;
    if (xinc < aspectX) 
      xoff = (wmax / aspectX)*floor(random((aspectX-xinc) -1));
    float yoff = 0;
    if (yinc < aspectY)
      yoff = (wmax / aspectY)*floor(random((aspectY-yinc) -1));
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
   val[0] = type; // expecting 1
   val[1] = x1;
   val[2] = y1;
   val[3] = x2;
   val[4] = y2;

 }
 Jdo(float type, float x1, float y1, float x2, float y2, float x3, float y3) {
   val = new float[10];
   val[0] = type; // expectin 2
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
