class CircleGrid {
  int gridX, gridY, gridSize;
  float grid, gInc;
  float zOffset;
  Sequin[] sequins;
  
  // noise vars
  float bright;
  NoizeBob_3D dubyBob;
  NoizeBob_3D colorBob;
  NoizeBob_3D zposBob;
  float duty;

  CircleGrid() {
    gridSize = 67;
    zOffset = 3.6;
    dubyBob = new NoizeBob_3D(0.001, 0.9, 1.0, 0.8);
    colorBob = new NoizeBob_3D(0.02, 0.5, 100.0, 0.7);
    zposBob = new NoizeBob_3D(0.002, 0.5, zOffset, 0.7);
    
    init();
  }
  void init() {
     DimHelper dimHelp = new DimHelper();
     gridX = gridY = dimHelp.widthArray(gridSize);
     sequins = new Sequin[gridSize * gridSize];
     int xoff = floor(0.5 * (width - gridSize * gridX));
     int yoff = floor(0.5 * (height - gridSize * gridY));
     
     colorMode(HSB, 100);
     
     for (int x = 0; x < gridSize; x++) {
       for (int y = 0; y < gridSize; y++) {
         int xi = floor(xoff + 0.5 * gridX + x * gridX);
         int yi = floor(yoff + 0.5 * gridY + y * gridY);
         int ri = floor(0.8 * gridX);
         sequins[y*gridSize + x] = new Sequin(xi, yi, ri);
       }
     }

  }

  void draw() {
   
   colorBob.incZ();
   colorBob.resetXoff();
   dubyBob.incZ();
   dubyBob.resetXoff();
   zposBob.incZ();
   zposBob.resetXoff();   
   for (int x = 0; x < gridSize ; x++) {
    colorBob.incX();
    colorBob.resetYoff();
    dubyBob.incX();
    dubyBob.resetYoff();
    zposBob.incX();
    zposBob.resetYoff();
    for (int y = 0; y < gridSize; y++) {

      
      // Calculate noise and scale by 255
      dubyBob.incY();
      bright = dubyBob.getBob(gridSize);
      colorBob.incY();
      float cin = colorBob.getBob(gridSize);
      zposBob.incY();


      // Set each pixel onscreen to a grayscale value


        //bright = map(bright, 64.0, 255.0, 250.0, 0.0);
        float brightIn = map(bright, 0.0, 0.70, 80.0, 100.0);
        
        color ci = color(cin, 100, brightIn);
        ci = color(60, cin, brightIn);
        fill(ci);
        stroke(ci);
        float zoff = zposBob.getBob(gridSize);

        //translate(0, 0 , 0 + zoff);
        rotateX(radians(0.1*(zoff - 0.5*zOffset)));
        rotateY(radians(0.1*(zoff - 0.5*zOffset)));
        sequins[x + y*gridSize].draw(zoff);
        rotateX(radians(0.0 - 0.1*(zoff - 0.5*zOffset)));
        rotateY(radians(0.0 - 0.1*(zoff - 0.5*zOffset)));
        //translate(0,0, 0 - zoff);

  }
  }    
}


/*
  void drawBasic() {

    
    for (int i = 0; i < sequins.length; i++) {
     sequins[i].draw();
   }
  }
   
  void drawVerticals() {   
   float mag = 100.0;
   
   for (int x = 0; x < gridSize ; x++) {
    colorBob.incX();
    colorBob.resetYoff();
    dubyBob.incX();
    dubyBob.resetYoff();
    for (int y = 0; y < gridSize; y++) {

      
      // Calculate noise and scale by 255
      bright = dubyBob.getBob();
      float cin = colorBob.getBob();
      println(cin);


      // Set each pixel onscreen to a grayscale value


        //bright = map(bright, 64.0, 255.0, 250.0, 0.0);
        float brightIn = map(bright, 0.0, 100.0, 67.0, 100.0);
        
        color ci = color(cin, 100, 100);
        fill(ci);
        stroke(ci);
        sequins[x + y*gridSize].draw();
    }
  }    
  }
}
*/

class Sequin{
  int x0, y0, r0;
  color c0;
  
  Sequin(int xi, int yi, int ri) {
    x0 = xi;
    y0 = yi;
    r0 = ri;
    
  }
  
  void draw(float factor) {
    float rad = r0 + 0.09 * factor;
    circle(x0, y0, rad);

  }
}
}
