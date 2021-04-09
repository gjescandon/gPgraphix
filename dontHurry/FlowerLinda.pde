class FlowerLinda {
  
  float index = 7;
  float ll;
  NoizeBob swbob, llbob, xbob, ybob;
  AutoPalette apal;
  float c0, cinc;
  PImage[] imgs;
  float[] xx, yy, ss;
  float[] t1, t2;
  int imax = 100;
  float ssinc;
  
  FlowerLinda() {
   setupImages();
   llbob = new NoizeBob(1.0, 0.001, 0.5);
   swbob = new NoizeBob(1.0, 0.001, 0.5);
   xbob = new NoizeBob(100.0, 0.001, 0.5);
   ybob = new NoizeBob(100.0, 0.001, 0.5);
   apal = new AutoPalette();
   c0 = 0.;
   cinc = 0.0004;
   
    xx = new float[imax];
    yy = new float[imax];
    ss = new float[imax];
    t1 = new float[imax];
    t2 = new float[imax];
   
   ssinc = 0.001;
   
   for (int i = 0 ; i < imax; i++) {
     xx[i] = 0.;
     yy[i] = 0.;
     ss[i] = 0.;
     t1[i] = 0.;
     t2[i] = 0.;
     
     
   }

 }
 
 void draw() {
   swbob.getBob();
   
   for (int i = 0 ; i < imax; i++) {
     pushMatrix();
     if ((i == 0) || (i>0 && ss[i-1] > 0.3)){
       //xx[i] += sin(swbob.getBobTail(10));
       //yy[i] += cos(swbob.getBobTail(10));
       if (ss[i] < 1.) ss[i] += ssinc;
     
       //translate(xx[i], yy[i], 0);
       scale(ss[i]);
       pushMatrix();
       rotateZ(t1[i]);
       image(imgs[i], 0, 0);
       popMatrix();
       t1[i] += 0.01*swbob.getBobTail(1);
     }
     popMatrix();
     
   }
   
 }
 

 
 
 void setupImages() {
   PImage[] timgs = new PImage[10];
    timgs[0] = loadImage("flowerLinda01.png");
    timgs[1] = loadImage("flowerLinda02.png");
    timgs[2] = loadImage("flowerLinda03.png");
    timgs[3] = loadImage("flowerLinda04.png");
    timgs[4] = loadImage("flowerLinda05.png");
    timgs[5] = loadImage("flowerLinda06.png");
    timgs[6] = loadImage("flowerLinda07.png");
    timgs[7] = loadImage("flowerLinda08.png");
    timgs[8] = loadImage("flowerLinda09.png");
    timgs[9] = loadImage("flowerLinda10.png"); 
    
    imgs = new PImage[imax];
   for (int i = 0 ; i < imax; i++) {
     imgs[i] = timgs[floor(random(10))];
     }    
   }
}
