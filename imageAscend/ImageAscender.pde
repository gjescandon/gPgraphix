class ImageAscender{
 PImage img, img2;
 float yoff, yinc, yoff2;
 QuilezFunctions qeq;
 PImage[] imgArr;
 int arrMax;
 float[] hArr, wArr, rArr;
 
 NoizeBob xbob, ybob, zbob, rotbob;
 ImageAscender() {
   setup();
 }
 
 
 void draw() {
   
   pushMatrix();
   translate((1. + xbob.getBob()) * 0.33 * width, yoff * (1 + ybob.getBob()));
   float ff = qeq.cubicPulse(0.5*height, 0.7*height, yoff);
   
   ff = 0.3 + ff;
   pushMatrix();
   scale(ff);
   image(img,0. - 0.5 * img.width, 0. - 0.5*height, img.width, img.height);
   popMatrix();
   popMatrix();
   yoff -= yinc;
   if (yoff < 0 - 0.5*img.height) yoff = 0.9 * height;
 }

 void drawTwo() {
   // one
   pushMatrix();
   translate((1. + xbob.getBob()) * 0.21 * width, yoff * (1 + ybob.getBob()));
   float ff = qeq.cubicPulse(0.5*height, 0.7*height, yoff);
   
   ff = 0.3 + ff;
   pushMatrix();
   scale(ff);
   image(img,0. - 0.5 * img.width, 0. - 0.5*img.height, img.width, img.height);
   pushMatrix();
    translate((1. + xbob.getBob()) * 0.29 * width, 0.);
   image(img2,0. - 0.5 * img2.width, 0. - 0.5*img2.height, img2.width, img2.height);
   popMatrix();
   popMatrix();
   popMatrix();
   yoff -= yinc;
   if (yoff < 0 - 0.5*img.height) yoff = 0.9 * height;

 
   // two
   /*
   pushMatrix();
   translate((1. + xbob.getBob()) * 0.33 * width, yoff2 * (1 + ybob.getBob()));
   float ff2 = qeq.cubicPulse(0.5*height, 0.7*height, yoff2);
   
   ff2 = 0.3 + ff2;
   pushMatrix();
   scale(ff2);
   image(img2,0. - 0.5 * img2.width, 0. - 0.5*img2.height, img2.width, img2.height);
   popMatrix();
   popMatrix();
   yoff2 -= yinc;
   if (yoff2 < 0 - 0.5*img2.height) yoff2 = 0.9 * height;
   */
}

 
 void drawGrid() {
   float xx = 7;
   float yy = 5;
   float attack = 300;
   float release = 300;
   float xf = 200 * qeq.expSustainedImpulse(frameCount, release,attack );
   float yf = 100 * qeq.expSustainedImpulse(frameCount, release, attack);
   //println(xf);
   
   for (int i = 0; i<  yy; i++) {
    for (int j=0; j< xx; j++) {
       int bobOff = floor(j + i * xx);
      //xf = xf * wArr[bobOff] / width;
      //yf = yf * hArr[bobOff] / height;
      
       float ff = qeq.cubicPulse(0.5*height, 0.7*height, yoff);
       
       ff = 0.4 + 0.8 * ff;
       xbob.getBob();
       ybob.getBob();
       zbob.getBob();
       rotbob.getBob();
       pushMatrix();
       translate((1. + xf * xbob.getBobTail(bobOff)) + (j) * (width/xx), (1 + yf * ybob.getBobTail(bobOff)) + (i)*(height/yy));
       pushMatrix();
       scale(ff +  rArr[bobOff] * zbob.getBobTail(10* bobOff));
       //rotate(0.009* frameCount + bobOff / PI +  (zbob.getBobTail(10* bobOff) - 0.5));
       rotate(bobOff / PI +  sin( rArr[bobOff] + 0.01* (rotbob.getBobTail(bobOff) * frameCount)));
       if ((j + i * xx) % 2 == 0) {
         image(img,0. - 0.5 * img.width, 0. - 0.5*img.height, img.width, img.height);
       } else {
         image(img2,0. - 0.5 * img.width, 0. - 0.5*img.height, img.width, img.height);
       }
       popMatrix();
       popMatrix();

     }
   }
 }

 
 void drawMany() {

   xbob.getBob();
   rotbob.getBob();
   float ff = 1.;
   
   for (int i = 0; i< arrMax; i++) {
     pushMatrix();
     translate(wArr[i] + 0.1* width * xbob.getBobTail(1000 * i), hArr[i]);
     ff= qeq.cubicPulse(0.5*height, 0.5*height, hArr[i]);
       
     ff = 0.1 + 0.1 * ff;
     pushMatrix();     
     rotate(rotbob.getBobTail(i) - 1. + rArr[i]);
     pushMatrix();
     scale(ff);
     image(img,0. - 0.5 * img.width, 0. - 0.5*img.height, img.width, img.height);
     popMatrix();
     popMatrix();
     popMatrix();
     hArr[i] -= yinc;
     if (hArr[i]< (-0.3*img.height)) {
       hArr[i] = 1.1*height;
     }
     //println(hArr[1]);

   }

    for (int i = 0; i< 3; i++) {
     pushMatrix();
     translate(wArr[i] + 0.1* width * xbob.getBobTail(1000 * i), hArr[i]);
     ff= qeq.cubicPulse(0.5*height, 0.5*height, hArr[i]);
       
     ff = 0.2 + 0.5 * ff;
     pushMatrix();     
     rotate(rotbob.getBobTail(10*i) - 0.5);
     pushMatrix();
     scale(ff);
     image(img,0. - 0.5 * img.width, 0. - 0.5*img.height, img.width, img.height);
     popMatrix();
     popMatrix();
     popMatrix();
     hArr[i] -= yinc;
     if (hArr[i]< (-0.3*img.height)) {
       hArr[i] = 1.*height;
       wArr[i] = random(width);
       
     }
     //println(hArr[1]);

   }
}
 
 void setup() {
   qeq = new QuilezFunctions();
   ybob = new NoizeBob(1., 0.0003, 0.6);
   xbob = new NoizeBob(1., 0.00006, 0.6);
   zbob = new NoizeBob(1., 0.00000003, 0.7);
   rotbob = new NoizeBob(1., 0.0000003, 0.7);
   //img = loadImage("chewUp_faces/bobbleHead.png");
   img = loadImage("chewUp_eyes/eyePurple.png");
   img2 = loadImage("chewUp_eyes/eyeGreen.png");

   arrMax = 56;
   hArr = new float[arrMax];
   rArr = new float[arrMax];
   wArr = new float[arrMax];
   for (int i = 0; i < arrMax; i++ ) {
     hArr[i] = random(height);
     rArr[i] = random(1.);
     wArr[i] = random(width);
   }
   
   yoff = 1.0* height;
   yoff2 = 1.0* height + img.height;
   yinc = 1.;

 }
}
