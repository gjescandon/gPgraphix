/**
 * Noise Wave
 * by Daniel Shiffman.  
 * 
 * Using Perlin Noise to generate a wave-like pattern. 
 */
// http://www.color-hex.com/color-palette/1836

// Constants
int Y_AXIS = 1;
int X_AXIS = 2;

float yoff03 = 0.0;        // 2nd dimension of perlin noise
float yinc03 = 0.008;
float yoff04 = 0.0;        // 2nd dimension of perlin noise
float yinc04 = 0.01;
float yoff01 = 0.0;        // 2nd dimension of perlin noise
float yinc01 = 0.007; 
float yoff02 = 0.0;        // 2nd dimension of perlin noise
float yinc02 = 0.006; 
float xinc = 0.05;
color sky1, sky2;
float noiseVal;
float noiseScale=0.02;
AutoPalette apal, apal2;
float c0, cinc;
NoizeBob nb;

void setup() {
  size(1280, 720);
  sky2 = color(215,254,255);
  sky1 = color(170,196,251);
  apal = new AutoPalette(0.6);
  apal2 = new AutoPalette(0.4, 0.5, 0.2);
  nb = new NoizeBob(1.0, 0.01, 0.5);
  c0 = 0.;
  cinc = 0.0004;
  colorMode(HSB, 1.);
  
}

void draw() {
  background(0);
  //setGradient();
  
  pushMatrix();
  translate(0, -0.5*height);
  drawGNoiseWave01(); //back wave
  drawGNoiseWave02();
  drawGNoiseWave03(); // front wave
  drawDemoNoiseWave();
  popMatrix();
  c0 += cinc;
  nb.getBob();
  println(frameCount);
  //saveFrame();
}

void drawGNoiseWave03() {
  float yMax = 0.7*height;
  float yMin = 0.5*height;
  
  stroke(apal.getColor(c0));
  fill(apal.getColor(c0 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.5);
  yoff03 = drawWave(yMin, yMax, yoff03, yinc03, xinc);

}

void drawGNoiseWave02() {
  float yMax = 0.8*height;
  float yMin = 0.5*height;
  
  stroke(apal.getColor(c0 + 0.25));
  fill(apal.getColor(c0 + + 0.25 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.7);
  yoff02 = drawWave(yMin, yMax, yoff02, yinc02, xinc);

}
void drawGNoiseWave01() {
  float yMax = 0.9*height;
  float yMin = 0.5*height;
  
  stroke(apal.getColor(c0 + 0.5));
  fill(apal.getColor(c0 + + 0.5 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.75);
  yoff01 = drawWave(yMin, yMax, yoff01, yinc01, xinc);

}

void drawDemoNoiseWave() {
  float yMax = 0.6 * height;
  float yMin = 0.5*height;
  stroke(apal.getColor(c0 + 0.75));
  fill(apal.getColor(c0 + + 0.75 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.5);  // noiseDetail(octavesCount, falloff)
  yoff04 = drawWave(yMin, yMax, yoff04, yinc04, xinc);
}

float drawWave(float yMin, float yMax, float yoff, float yinc, float xinc) {
  
    beginShape(); 
  
  float xoff = nb.getBobTail(1);       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, yMin, yMax); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    y = (y- 0.5*height) *sin(PI*((x+50)/(width+100)));
    vertex(x, height - y); 
    // Increment x dimension for noise
    xoff += xinc;
  }
  
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, height- yMin, height - yMax); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    y = (y- 0.5*height) *sin(PI*((x+50)/(width+100)));
    vertex(width - x, height - y); 
    // Increment x dimension for noise
    xoff -= xinc;
  }  
  // increment y dimension for noise
  yoff += yinc;
  //vertex(width, height);
  //vertex(0, height);
  endShape(CLOSE);
  return yoff;
}


void setGradient() {

  //println(c0);
  for (int y = 0; y <= height; y++) {
     stroke(apal2.getColor(c0 + 0.5*(2.+sin(HALF_PI * y / height))));
     line(0,y,width,y); 
  }
}
