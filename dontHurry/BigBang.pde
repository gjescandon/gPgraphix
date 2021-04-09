class BigBang {
  
  float index = 7;
  float ll;
  NoizeBob swbob, llbob, xbob, ybob;
  AutoPalette apal;
  float c0, cinc;

  BigBang() {
   llbob = new NoizeBob(1.0, 0.001, 0.5);
   swbob = new NoizeBob(1.0, 0.001, 0.5);
   xbob = new NoizeBob(100.0, 0.001, 0.5);
   ybob = new NoizeBob(100.0, 0.001, 0.5);
   apal = new AutoPalette();
   c0 = 0.;
   cinc = 0.0008;

 }
 
 void draw(float rad) {
   float ll = rad;
   
   for (int  i =0; i < ll; i++) {
    strokeWeight(1+llbob.getBobTail(1));
    stroke(apal.getColor(sin(c0 + i*cinc)));
    circle(0,0,i);
   }
   noFill();
   
   c0 += cinc;
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
