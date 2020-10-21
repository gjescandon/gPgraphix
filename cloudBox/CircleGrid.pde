class CircleGrid {
  int gridX, gridY, gridSize;
  float grid, gInc;
  float factor;
  int nload;
  float falloff;
  
  CircleGrid() {
    gridSize = 13;
    float factor = 13.0;
    float falloff = 0.5;
    init();
  }
  void init() {
     DimHelper dimHelp = new DimHelper();
     gridX = gridY = dimHelp.widthArray(gridSize);
  }
  
}

class Sequin{
  int x0, y0, r0;
  color c0;
  Sequin(int xi, int yi, int ri, color colorIn) {
    x0 = xi;
    y0 = yi;
    r0 = ri;
    c0 = colorIn;
  }
  
  void draw() {
    fill(c0);
    stroke(c0);
    circle(x0, y0, r0);
  }
}
