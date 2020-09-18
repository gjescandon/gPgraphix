float x, y;
Fractal frac;
FractalDF fracDF;
void setup() {
  size(720,720);
  frac = new Fractal();
  fracDF = new FractalDF();
}

void draw() {
  background(0);
  frac.draw();
  noLoop();
  println(mouseX, mouseY);
}
