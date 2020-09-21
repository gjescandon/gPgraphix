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

 //styles.draw();
 styles.drawStretch();
 styles.drawRotate();
 
}
