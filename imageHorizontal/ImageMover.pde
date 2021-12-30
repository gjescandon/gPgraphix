class ImageMover{
 PImage img;
 float xoff, xinc;
 QuilezFunctions qeq;
 int[] imgXArr;
 int NN;
 NoizeBob xbob, ybob;
 ImageMover() {
   setup();
 }
 
 
 void draw() {
   
   for (int i = 0; i< NN; i++) {
     pushMatrix();
     xbob.getBob();
     float mover = imgXArr[i] * (1 + xbob.getBobTail(i));
     ybob.getBob();
     float shaker = (1. + ybob.getBobTail(i*2)) * 0.4 * height;
     translate(mover , shaker);
     float ff = qeq.cubicPulse(0.5*width, 0.7*width, imgXArr[i]);
     
     ff = 0.3 + ff;
     pushMatrix();
     scale(ff);
     image(img,0. - 0.5 * img.width, 0. - 0.5*height, img.width, img.height);
     popMatrix();
     popMatrix();
     imgXArr[i] -= xinc;
     if (imgXArr[i] < 0 - 0.5*img.width) imgXArr[i] = floor(0.9 * width + floor(width/NN));
   }
 }
 
 void setup() {
   qeq = new QuilezFunctions();
   ybob = new NoizeBob(1., 0.01, 0.3);
   xbob = new NoizeBob(1., 0.006, 0.3);
   
   img = loadImage("chewUp_faces/blueFace.png");
   
   NN = floor(width/img.width) + 1;
   float xoff = floor(width/NN);
   imgXArr = new int[NN];
   for (int i = 0; i< NN; i++) {
     imgXArr[i] = width + floor(i * xoff);
   }
   //xoff = 1.0* width;
   xinc = 1.;

 }
}
