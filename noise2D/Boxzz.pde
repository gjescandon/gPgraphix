class Boxzz {
  
  float index = 7;
     float ll;
  NoizeBob swbob, llbob, xbob, ybob;
 Boxzz() {
   llbob = new NoizeBob(1.0, 0.001, 0.5);
   swbob = new NoizeBob(1.0, 0.001, 0.5);
   xbob = new NoizeBob(100.0, 0.001, 0.5);
   ybob = new NoizeBob(100.0, 0.001, 0.5);
 }
 
 void draw() {
   ll = width * 0.5 * llbob.getBob();
   strokeWeight(100 * swbob.getBob());
   stroke(1.);
   fill(0.);
   pushMatrix();
   rotateZ(-0.001*frameCount);
   drawBox();
   popMatrix();
 }
 
 
 void drawBox() {
   pushMatrix();
   float xb = xbob.getBob();
   float yb = ybob.getBob();
  for (float i=0; i< index; i++) {
   rotateZ(TWO_PI / index);
   rect(xb,yb,0.3*width,0.3*height);
  }
  popMatrix();
   
 }
}
