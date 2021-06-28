class BlowerCurve {
  AutoPalette apal;
  int iMax = 740;
  NoizeBob cbob, zbob, rbob;
 BlowerCurve() {
   apal = new AutoPalette(0.8, 0.8, 0.8);
   cbob = new NoizeBob(1.0, 0.01, 0.6);
   zbob = new NoizeBob(1.0, 0.0, 0.6);
   rbob = new NoizeBob(1.0, 0.01, 0.6);
 }
  void draw() {
    drawCurve(0.2);
    drawCurve(0.6);
    drawCurve(0.);
    drawCurve(0.4);
    drawCurve(0.8);
}
  void drawCurve(float offset) {
    float xx, yy, zz;
    zz = 0;
    float rr = 1;
    cbob.getBob();
    
    for (int i= 0; i < iMax; i++) {
      pushMatrix();
      xx = i * sin((TWO_PI * i * 5 / iMax) + offset * TWO_PI);
      yy = i * cos((TWO_PI * i * 5 / iMax) + offset * TWO_PI );
      zz = map(i, 0, iMax, 0, -100);
      fill(apal.getColor(cbob.getBobTail(iMax - i) + offset));
      noStroke();
      translate(xx,yy,zz * ( zbob.getBobTail(i) + offset));
      rr = map(i, 0, iMax, 5, 21 * rbob.getBobTail(i));
      sphere(rr);
      popMatrix();
    }
    
  }
}
