class InkLiner {
 
  float centerX, centerY;
  NoizeBob vertLbob, vertRbob,topDbob,botULbob,zbob, cxbob, cybob, sb;
  float fcf; // frameCountfactr
  InkLiner() {
    init();
    
  }
  
  void init() {
    
    
        
  centerX = 0.5*width;
  centerY = 0.5*height;
    
  vertLbob = new NoizeBob(1.0, 0.03, 0.4);
  vertRbob = new NoizeBob(1.0, 0.03, 0.4);
  topDbob = new NoizeBob(1.0, 0.0002, 0.5);
  botULbob = new NoizeBob(1.0, 0.0002, 0.5);
  sb = new NoizeBob(1.0, 0.001, 0.6);
  zbob = new NoizeBob(1.0, 0.001, 0.8);
  cxbob = new NoizeBob(1., 0.003, 0.6);
  cybob = new NoizeBob(1., 0.003, 0.5);
  
  fcf = 0.03;
  }
  
  void draw() {
  
  colorMode(HSB,1.);
  
  sb.getBob();
  centerX = 0.5* width + 100.*(cxbob.getBob() - 0.5);
  centerY = 0.37* height + 100.*(cybob.getBob() - 0.5);;

  float xA, xB, yA, yB;
  float avl1, bvl1, avl2, bvl2;
  
  
  float xa, xb, ya, yb;
  xa = xb = 0.;
  ya = yb = 0.;

  // bottomUp
   xA = 0.;
   xB = width;
   yA = 1.*height;
   yB = 1.*height;
  zbob.getBob();    
  for (int j = height; j > centerY ; j-=2) {
    ya = j;
    yb = j;

   //stroke(abs(sin(0.6*xa + xoff - 0.1*frameCount)));
   float sat = abs(sin(0.5*sb.getBobTail(j)*ya + xoff + fcf*frameCount));
   stroke(zbob.getBobTail(1), sat, 0.6);
   strokeWeight(1. + 3. * vertLbob.getBobTail(1000 + j));
   line(xA,ya,xB,yb);
  }  
  
  // topDown
   xA = 0.;
   xB = width;
   yA = 0;
   yB = 0;
   
  for (int j = 0; j < centerY ; j+=2) {
    ya = j;
    yb = j;

   //stroke(abs(sin(0.6*xa + xoff - 0.1*frameCount)));
   float sat = abs(sin(0.5*sb.getBobTail(j)*ya + xoff + fcf*frameCount));
   stroke(zbob.getBobTail(2*j), sat, 0.6);
   strokeWeight(1. + 3. * vertLbob.getBobTail(10 - j));
   line(xA,ya,xB,yb);
  }  
  
  
  //vertLeft
  
   xA = 0.;
   xB = 0.;
   yA = 0.;
   yB = 1.*height;
  
  vertLbob.getBob();
  
   avl1 = 1.* (centerY - yA) / (centerX - xA);
   bvl1 = centerY - avl1*centerX;

   avl2 = 1.* (centerY - yB) / (centerX - xB);
   bvl2 = centerY - avl2*centerX;

  
  for (int i = 0; i < centerX; i+=2) {
    xa = xA + i;
    xb = xB + i;
    ya = avl1*xa + bvl1;
    yb = avl2*xb + bvl2;
    ya = ya + 1.3 * ya * (vertLbob.getBobTail(10-i) - 0.5) * (centerX - i) / (centerX);
    yb = yb - 0.4 * yb * (vertLbob.getBobTail(100-i) - 0.5) * (centerX - i) / (centerX);

   //stroke(abs(sin(0.6*xa + xoff - 0.1*frameCount)));
   stroke(0.5, 0., abs(sin(0.5*sb.getBobTail(i)*xa + xoff - fcf*frameCount)));
   strokeWeight(1. + 3. * sb.getBobTail(10 - i));
   line(xa,ya,xb,yb);
  }
  
  
    
  // vertRight
   xA = width;
   xB = width;
   yA = 0.;
   yB = 1.*height;
   
   avl1 = 1.* (centerY - yA) / (centerX - xA);
   bvl1 = centerY - avl1*centerX;

   avl2 = 1.* (centerY - yB) / (centerX - xB);
   bvl2 = centerY - avl2*centerX;
   vertRbob.getBob();
   float xmin = width-centerX;
  for (int i = 0; i < xmin; i+=2) {
    xa = xA - i;
    xb = xB - i;
    ya = avl1*xa + bvl1;
    ya = ya + 1.3 * ya * (vertRbob.getBobTail(100-i) - 0.5) * (xmin - i) / (xmin);
    yb = avl2*xb + bvl2;
    yb = yb - 0.4 * yb * (vertRbob.getBobTail(10-i) - 0.5) * (xmin - i) / (xmin);

   //stroke(abs(sin(0.6*xa + xoff - 0.1*frameCount)));
   stroke(abs(sin(0.5*sb.getBobTail(i)*xa + xoff - fcf*frameCount)));
   strokeWeight(1. + 3. * sb.getBobTail(1000 + i));
   line(xa,ya,xb,yb);
  }
  
    


}
  
}
