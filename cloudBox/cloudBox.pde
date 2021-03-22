float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.007; 
float xoff, yoff;
float bright;
NoizeBob dubyBob;
NoizeBob_3D dddBob;
float duty;

PImage cloudbox;
QuilezFunctions qf;

void setup() {
  size(1280, 720);
  
  
  dubyBob = new NoizeBob(1.0, 0.0001, 0.3);
  dddBob = new NoizeBob_3D();
  
  qf = new QuilezFunctions();
}

void draw() {
  colorMode(HSB,1.0);
  background(0.46, 1., 1.);
  
  cloudbox = createImage(floor(width * 0.9), floor(height * 0.9), ARGB);

  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);
  
  cloudbox.loadPixels();

  xoff = 0.0; // Start xoff at 0
  bright = 5;
  
  duty = dubyBob.getBob();
  duty = map(duty, 0.0, 1.0, 15 + 35*(1+sin(0.01* frameCount)), 85.0);
  //println(duty);
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  loadCloudPixels(160);
  loadCloudPixels(90);

  cloudbox.updatePixels();
  image(cloudbox, 0.01 * width, 0.01 * height, 0.98*width, 0.98*height);
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
      bright = dddBob.getBob(xoff,yoff,zoff)*mag;
      bright *= qf.expSustainedImpulse(1.0*frameCount, 200., 0.1);
      //println(frameCount + " "  + bright);
      
      // Set each pixel onscreen to a grayscale value

      if (bright > duty) {
        //bright = map(bright, 64.0, 255.0, 250.0, 0.0);
        bright = map(bright, 64.0, 96.0, 64.0, 254.0);
        colorMode(HSB, 255);
        
        //cloudbox.pixels[x+y*cloudbox.width] = color(duty + 120, 100, bright);
        cloudbox.pixels[x+y*cloudbox.width] = color(1.0);
      }
    }
  } 
  
}
