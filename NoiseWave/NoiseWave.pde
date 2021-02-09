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

void setup() {
  size(1280, 720);
  sky2 = color(215,254,255);
  sky1 = color(170,196,251);
}

void draw() {
  background(51);
  setGradient(0, 0, width, height, sky1, sky2, Y_AXIS);
  
  drawGNoiseWave01(); //back wave
  drawGNoiseWave02();
  drawGNoiseWave03(); // front wave
  drawDemoNoiseWave();
  
  
}

void drawGNoiseWave03() {
  int yMax = height - 25;
  int yMin = height - 70;
  
  stroke(137,236,218);
  fill(67,232,216);
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.2);
  yoff03 = drawWave(yMin, yMax, yoff03, yinc03, xinc);

}

void drawGNoiseWave02() {
  int yMax = height - 100;
  int yMin = height - 140;
  
  stroke(67,232,216);
  fill(64,224,208);
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(8,0.7);
  yoff02 = drawWave(yMin, yMax, yoff02, yinc02, xinc);

}
void drawGNoiseWave01() {
  int yMax = height - 200;
  int yMin = height - 240;
  
  stroke(64,224,208);
  fill(59,214,198);
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(3,0.9);
  yoff01 = drawWave(yMin, yMax, yoff01, yinc01, xinc);

}

void drawDemoNoiseWave() {
  int yMax = height - 5;
  int yMin = height - 50;
  stroke(179,236,236);
  fill(137,236,218);
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(2,0.5);  // noiseDetail(octavesCount, falloff)
  yoff04 = drawWave(yMin, yMax, yoff04, yinc04, xinc);
}

float drawWave(int yMin, int yMax, float yoff, float yinc, float xinc) {
  
    beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, yMin, yMax); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += xinc;
  }
  // increment y dimension for noise
  yoff += yinc;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  return yoff;
}


void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
