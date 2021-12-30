class Bkgrndr {
  
  AutoPaletteRGB apal;
  NoizeBob cbob;
  float fc1, fc2 ,fc3, fc4, fc5;
  float rat;
 Bkgrndr(){
    apal = new AutoPaletteRGB();
    cbob = new NoizeBob(1.0, 0.001, 0.3);
    fc1 = random(1);
    fc2 = random(1);
    fc3 = random(1);
    fc4 = random(1);
    fc5 = random(1);
    rat = 10.0/height;
 }
 
 void draw() {
   
   pushMatrix();
   translate(0,0,-20);
   for (int i=0; i<height; i++) {
      stroke(apal.getColorDark((1.0+0.9*sin(1.0*i/height+ 0.00003*frameCount))));
      line(0,i,width,i);

   }
  popMatrix();
   
 }
}
