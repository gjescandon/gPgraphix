class NoizeWave {
  
float yoff03 = random(1);        // 2nd dimension of perlin noise
float yinc03 = 0.000008;
float yoff04 = random(1);        // 2nd dimension of perlin noise
float yinc04 = 0.00006;
float yoff01 = random(1);        // 2nd dimension of perlin noise
float yinc01 = 0.000004; 
float yoff02 = random(1);        // 2nd dimension of perlin noise
float yinc02 = 0.000006;
float yNoff = 0.;
float yNinc = 0.00031;
float xinc = 0.05;
color sky1, sky2;
float noiseVal;
float noiseScale=0.02;
AutoPalette apal, apal2;
float c0, cinc;
NoizeBob nb;
  NoizeWave() {
  
  apal = new AutoPalette(0.6);
  apal2 = new AutoPalette(0.4, 0.5, 0.2);
  nb = new NoizeBob(1.0, 0.000001, 0.5);
  c0 = 0.;
  cinc = 0.001;
  colorMode(HSB, 1.);

}
  
void draw() {
  
  pushMatrix();
  translate(0, -0.5*height, -4);
  drawGNoiseWave01(); //back wave
  popMatrix();

  pushMatrix();
  translate(0, -0.5*height, -3);
  drawGNoiseWave02();
  popMatrix();

  pushMatrix();
  translate(0, -0.5*height, -2);
  drawGNoiseWave03(); // front wave
  popMatrix();

  pushMatrix();
  translate(0, -0.5*height, -1);
  drawDemoNoiseWave();
  popMatrix();
  
}

void drawGNoiseWave03() {
  float yMax = 0.7*height;
  float yMin = 0.5*height;
  
  stroke(apal.getColor(c0));
  fill(apal.getColorDark(c0 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.5);
  yoff03 = drawWave(yMin, yMax, yoff03, yinc03, xinc);

}

void drawGNoiseWave02() {
  float yMax = 0.8*height;
  float yMin = 0.5*height;
  
  stroke(apal.getColor(c0 + 0.25));
  fill(apal.getColorDark(c0 + + 0.25 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.7);
  yoff02 = drawWave(yMin, yMax, yoff02, yinc02, xinc);

}
void drawGNoiseWave01() {
  float yMax = 0.9*height;
  float yMin = 0.5*height;
  
  stroke(apal.getColor(c0 + 0.5));
  fill(apal.getColorDark(c0 + + 0.5 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.75);
  yoff01 = drawWave(yMin, yMax, yoff01, yinc01, xinc);

}

void drawDemoNoiseWave() {
  float yMax = 0.6 * height;
  float yMin = 0.5*height;
  stroke(apal.getColorDark(c0 + 0.75));
  fill(apal.getColor(c0 + + 0.75 + 0.5));
  // We are going to draw a polygon out of the wave points
  
  noiseDetail(4,0.5);  // noiseDetail(octavesCount, falloff)
  yoff04 = drawWave(yMin, yMax, yoff04, yinc04, xinc);
}

float drawWave(float yMin, float yMax, float yoff, float yinc, float xinc) {
  
    beginShape(); 
  
  float xoff = nb.getBob();       // Option #1: 2D Noise
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
   yoff += yinc;
  }
  
  
  /*
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
  
  */
  // increment y dimension for noise
  vertex(width+1, height);
  vertex(-1, height);
  endShape(CLOSE);
  return yoff;
}


void setGradient() {

  //println(c0);
  int ymin = 0-height/4;
  int ymax = height/2;
  
  float dmin = 1.;
  float dmax = 0.;
  float ydelta = ymax - ymin;
  for (int y = 0; y <= ydelta; y++) {
    float y0 = y/ydelta;
     stroke(apal2.getColor(0.5 + 0.48*sin(c0 + y0)));
     line(0-0.2*width,y+ymin,1.2*width,y+ymin); 
     if (y0 < dmin) dmin = y0;
     if (y0 > dmax) dmax = y0;
  }
  c0 += cinc;
  //c0 -= floor(c0);
 //println ("c0 " + c0);
 //println ("dmin " + dmin);
 //println("dmax " + dmax);
}
  
}
