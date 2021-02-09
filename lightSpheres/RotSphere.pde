class RotSphere {
 float tx, ty, tz, txInc, tyInc, tzInc;
 float x0, y0, z0;
 float tOff;
 color fillColor;
 NoizeBob tBob, xBob, yBob, zBob, cBob;
 RotSphere() {
   tOff = 0.0;
   setup();
 }
 
 RotSphere(float thetaOffset) {
   tOff = thetaOffset;
   setup();
 }
 
 void move() {
   float tn = tBob.getBob();
   float y = y0 + yBob.getBob() + 200 * cos(ty + tOff + tn);
   float x = x0 + xBob.getBob() + 200 * cos(tx + tOff + tn);
   float z = z0 + zBob.getBob() + 600 * sin(tz + tOff + tn);
   
   dimUpdate();
   pushMatrix();
   translate(x, y, z);
   fill(color(3 +  cBob.getBob(), 100, 100));
   sphere(73);
   popMatrix();
   
 }
 
 void dimUpdate() {
   tx += txInc;
   if (tx > TWO_PI) {
     tx = 0.0;
   }
   ty += tyInc;
   if (ty > TWO_PI) {
     ty = 0.0;
   }
   tz += tzInc;
   if (tz > TWO_PI) {
     tz = 0.0;
   }
   
   
 }
 
 void setup() {
    x0 = 0.3 * width;
   y0 = 0.5 * height;
   z0 = -200.0;
   tx = ty = tz = 0.0;
   txInc = 0.001;
   tyInc = 0.00025;
   tzInc = 0.001;
   tBob = new NoizeBob(0.3, 0.6);
   xBob = new NoizeBob(0.3*width, 0.4);
   yBob = new NoizeBob(0.3*height, 0.4);
   zBob  = new NoizeBob(60, 0.4);
   cBob = new NoizeBob(40, 0.4, 4, 0.03);
   colorMode(HSB, 100);
   fillColor = color(10 +cBob.getBob(), 100, 100);

 }
}
