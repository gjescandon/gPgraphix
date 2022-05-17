class ColorBox {
  AutoPalette apal;
  NoizeBob cbob, xbob, ybob;
  float cc;
 ColorBox(){
   apal = new AutoPalette(0.8);
   cbob = new NoizeBob(1.0,0.001,0.6);
   xbob = new NoizeBob(1.0,0.1,0.6);
   ybob = new NoizeBob(1.0,0.1,0.6);
 }
 
 void draw(int xa, int ya) {
 int cnt = 0;
 float coff = 0;
 draw(xa, ya, cnt, coff);
 }
void draw(int xa, int ya, int cnt, float coff) {
    xbob.getBob();
   ybob.getBob();
   int xx = xa;
   int yy = ya;
   
   fill(apal.getColor(coff + cbob.getBob()));
   rect(xa,ya,width-xa - 50 *(cnt),height-ya);
   if ((xx < 0.5*width -100) && (yy < height - 50)) draw(xx + 50, yy + 25, cnt+1, coff+0.7);
  
   
 }
}
