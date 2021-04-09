class Buables {
  NoizeBob llbob, xbob, ybob;
  
  Buables(){
    llbob = new NoizeBob(1.0, 0.001, 0.5);
    xbob = new NoizeBob(1.0, 0.01, 0.7);
    ybob = new NoizeBob(1.0, 0.01, 0.7);
   
 };
  
  
  void draw(float rad) {
   float ll = rad;
   //translate(0.5*width, 0.5*height, -1);
   float imax = 13;
   float tr = 1./imax;
   //rotateZ(llbob.getBobTail(1));
   for (int i = 0; i< imax; i++) {
     pushMatrix();
     translate(0.5*ll * sin(TWO_PI * i *tr), 0.5*ll * cos(TWO_PI * i * tr),-i);
     scale( (1+ llbob.getBobTail(i)) );
     drawBuable();
     popMatrix();
   }
   
  }
  
  void drawBuable() {
   strokeWeight(4.);
   stroke(0.);
   fill(1.);
   float x = 0;
   float y = 0;
   float r = 100 + llbob.getBobTail(1);
   xbob.getBob();
   ybob.getBob();
   
   for (int i = 0; i < 4; i++) {
     
    circle(-2+4*xbob.getBobTail(20*i), -2+4*ybob.getBobTail(20*i), r / (0.9 * i)); 
   }
    
  }
}
