FreakyDots fdots;
FreakyPolarDots fpdots;
FreakyPolarSpheres fps;
MoireDots mdots;
MoireTriangles mtris;
float ninc;
float theta, thetaInc;

void setup() {
  size(720, 720, P3D);
  frameRate(30);
  fdots = new FreakyDots();
  fpdots = new FreakyPolarDots();
  fps = new FreakyPolarSpheres();
  mdots = new MoireDots();
  mtris = new MoireTriangles();
  ninc = 0.;
  theta = 0.;
  thetaInc = 0.03;
}

void draw() {
  colorMode(HSB,100);
  background(0);
  directionalLight(0, 0, 100, sin(theta), cos(theta), -1);
  drawNoiseBackground();
  //fdots.draw();
  //fpdots.draw();
  fps.draw();
  //mdots.draw();
  //mtris.draw();
  theta += thetaInc;
  
  //saveFrame();
}

void drawNoiseBackground() {
  
float noiseVal;
float noiseScale=0.02;
for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      noiseDetail(3,0.6);
      noiseVal = 50* pow(noise(floor(x/30) + (0.5 + sin(ninc)), floor(y/30) + (0.5+cos(ninc))),2.);
      stroke(60,100,40 - noiseVal);
      point(x,y,-100);
    }
  }
  
  ninc += 0.1;
}
