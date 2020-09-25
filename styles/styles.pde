AutoPalette autoPal;
StylesElements styles;

ShapeDemo shape;
void setup() {
  size(720, 720, P3D);
  autoPal = new AutoPalette(random(1));
  styles = new StylesElements();
  shape = new ShapeDemo();

}

void draw() {
 colorMode(autoPal.getColor(0.3));
 background(0.9);
 directionalLight(1.,1.,1.,0.618*sin(0.01*frameCount),0.618,-1.);
 styles.drawStretch();
 //styles.drawRotate();
 
}
