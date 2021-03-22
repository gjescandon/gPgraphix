class AutoFrame {
  
  float ratio;
  AutoPalette apal;
  NoizeBob fBob, cBob;
  color lastColor;
  
  AutoFrame() {
    ratio = 0.5;
    apal = new AutoPalette(0.9,0.8,0.2);
    fBob = new NoizeBob(0.03 * height, 0.0001,0.6);
    cBob = new NoizeBob(1.0, 0.00001,0.6);
  }


 void draw() {
   drawBottomTop();
   drawSides();
 }
 
 void drawBottomTop() {
   float xx = 0.0;
   float fbi = fBob.getBob();
   float hh = (fbi)*(1.+1.4*cBob.getBobTail(floor(50*xx)));
   while (xx < 0.5*width) {
     fbi = fBob.getBobTail(1);
     
     hh = (fbi)*(1.+1.4*cBob.getBobTail(floor(50*xx)));
     float yy = height - hh;
     fill(apal.getColor(cBob.getBob()));     
     xx += fbi;
     
     rect(0.5*width+xx,yy,fbi,hh);
     rect(0.5*width-xx,yy,fbi,hh);     
     rect(0.5*width+xx,0,fbi,hh);
     rect(0.5*width-xx,0,fbi,hh);     
   }
   //center block
   rect(0.5*(width),0,fbi,hh);
   rect(0.5*(width),height-hh,fbi,hh);

 }

 void drawSides() {
   float yy = 0.0;
   float fbi = fBob.getBobTail(0);
   float ww = (fbi)*(1.+1.4*cBob.getBobTail(floor(50*yy)));
   while (yy < 0.5*height) {
     fbi = fBob.getBobTail(1);
     
     ww = (fbi)*(1.+1.4*cBob.getBobTail(floor(50*yy)));
     float xx = width - ww;
     fill(apal.getColor(cBob.getBob()));     
     yy += fbi;
     
     rect(0,0.5*height+yy,ww,fbi);
     rect(0,0.5*height-yy,ww,fbi);     
     rect(xx,0.5*height+yy,ww,fbi);
     rect(xx,0.5*height-yy,ww,fbi);     
   }
   //center block
   rect(0,0.5*(height),ww,fbi);
   rect(width-ww,0.5*(height),ww,fbi);  
 }
}
