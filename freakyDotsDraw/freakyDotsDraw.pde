FreakyDots fdots;
MoireDots mdots;
MoireTriangles mtris;

void setup() {
  size(720, 720);
  frameRate(30);
  fdots = new FreakyDots();
  mdots = new MoireDots();
  mtris = new MoireTriangles();
  
}

void draw() {
  background(255);
  fdots.draw();
  //mdots.draw();
  //mtris.draw();
  /*
float noiseVal;
float noiseScale=0.02;
for (int y = 0; y < height; y++) {
    for (int x = 0; x < width/2; x++) {
      noiseDetail(3,0.5);
      
      noiseVal = noise((mouseX+x) * noiseScale, (mouseY+y) * noiseScale);
      stroke(noiseVal*255);
      point(x,y);
      noiseDetail(8,0.65);
      noiseVal = noise((mouseX + x + width/2) * noiseScale, 
                       (mouseY + y) * noiseScale);
      stroke(noiseVal * 255);
      point(x + width/2, y);
    }
  }
  */
}
