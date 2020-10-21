float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.07; 
float xoff, yoff;
float bright;
NoizeBob dubyBob;
float duty;

PImage cloudbox;

void setup() {
  size(720, 720);
  frameRate(30);
  
  
  dubyBob = new NoizeBob(1.0, 0.5);
}

void draw() {
  background(0);
  colorMode(RGB,255);
  fill(56, 228, 56);
  
  rect(0.1*width, 0.1 * height, 0.8* width, 0.8*height);

  cloudbox = createImage(floor(width * 0.8), floor(height * 0.8), ARGB);

  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);
  
  cloudbox.loadPixels();

  xoff = 0.0; // Start xoff at 0
  bright = 5;
  
  duty = dubyBob.getBob();
  duty = map(duty, 0.0, 1.0, 60.0, 75.0);
  println(duty);
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  loadCloudPixels(160);
  loadCloudPixels(90);

  cloudbox.updatePixels();
  image(cloudbox, 0.1 * width, 0.1 * height);
  zoff += zincrement; // Increment zoff
  
 // saveFrame();
  
}

void loadCloudPixels(int mag) {
   float cmag = 1.0 * mag/255;
   
   for (int x = 0; x < cloudbox.width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < cloudbox.height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      bright = noise(xoff,yoff,zoff)*mag;

      // Set each pixel onscreen to a grayscale value

      if (bright > duty) {
        //bright = map(bright, 64.0, 255.0, 250.0, 0.0);
        bright = map(bright, 64.0, 96.0, 64.0, 254.0);
        colorMode(HSB, 255);
        
        cloudbox.pixels[x+y*cloudbox.width] = color(duty + 120, 100, bright);
      }
    }
  } 
  
}
