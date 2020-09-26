AutoPalette autoPal;
StylesElements styles;
color bc;
ShapeDemo shape;
void setup() {
  size(720, 720, P3D);
  autoPal = new AutoPalette(0.3);
  styles = new StylesElements();
  bc = autoPal.getColor(random(1));
}

void draw() {
 colorMode(HSB,1.);
 background(bc);
 directionalLight(1.,0.,1.,0.618*sin(0.01*frameCount),0.618,-1.);
 styles.drawStretch();
 styles.drawUncover();
 styles.drawRotate();
 //saveFrame();
}
