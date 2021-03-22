class AutoFrame {
  
  float ratio;
  color[] colorArr;
  NoizeBob fBob;
  color lastColor;
  
  AutoFrame() {
    ratio = 0.1;
    fBob = new NoizeBob(0.05 * height, 0.3);
  }

  AutoFrame(PImage pimg) {
    ratio = 0.6;
    colorArr = loadPallet(13, pimg);
    fBob = new NoizeBob(0.03 * height, 0.8);
  }

 void draw() {
   drawBottom();
   drawSides();
   drawTop();
 }
 
 void drawBottom() {
   float xx = 0.0;
   while (xx < width) {
     float fbi = fBob.getBobPlusAlpha(1);
     if (random(1) > 0.9) fbi = fBob.getBobInc();
     float yy = height - fbi - fbi;
     fill(getColor());
     rect(xx, yy, fbi, fbi + fbi);
     xx += fbi;
   }
 }

 void drawSides() {
   float yy = 0.0;
   while (yy < width) {
     float fbi = fBob.getBobPlusAlpha(1);
     if (random(1) > 0.9) fbi = fBob.getBobInc();
     float xx = 0.0;
     fill(getColor());
     rect(xx, yy, fbi + fbi, fbi);
     yy += fbi;
   }    
   yy = 0.0;
   while (yy < width) {
     float fbi = fBob.getBobPlusAlpha(1);
     if (random(1) > 0.9) fbi = fBob.getBobInc();
     float xx = width - fbi - fbi;
     fill(getColor());
     rect(xx, yy, fbi + fbi, fbi);
     yy += fbi;
   }
 }
 
 void drawTop() {
   float xx = 0.0;
   while (xx < width) {
     float fbi = fBob.getBobInc();
     float yy = 0.0;
     fill(getColor());
     rect(xx, yy, fbi, fbi + fbi);
     xx += fbi;
   }   
 }
 
 color getColor() {
   color cc = lastColor;
   while (cc == lastColor) {
     cc = colorArr[floor(random(colorArr.length))];
   }
   lastColor = cc;
   return cc;
 }
}
