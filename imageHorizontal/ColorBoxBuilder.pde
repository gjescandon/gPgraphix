class ColorBoxBuilder {
 
  AutoPalette apal;
  EmptyTemplate mt = new EmptyTemplate();
  PImage cbox;
  NoizeBob cbob;
  float coff, cinc;
  float[] scale;
  float[] xoff;
  float[] yoff;
  float[] inc;
  float[] dir;
  float rotOff;
  NoizeBob[] xrot;
  NoizeBob[] zrot;
  
  int iMax = 56;
  
  ColorBoxBuilder() {
    rotOff = 0.1;
    apal = new AutoPalette();
    cbob = new NoizeBob(1.,0.0021,0.7);
    scale = new float[iMax];
    xoff = new float[iMax];
    yoff = new float[iMax];
    inc = new float[iMax];
    dir = new float[iMax];
    xrot = new NoizeBob[iMax];
    zrot = new NoizeBob[iMax];
    
    for (int i=0; i<iMax; i++) {
      scale[i] = 0.0;
      xoff[i] = random(1)*width;
      yoff[i] = random(1)*height;
      xrot[i] = new NoizeBob(0.06,0.01,0.3);
      zrot[i] = new NoizeBob(rotOff,0.01,0.3);
      inc[i] = 0.0006+0.001*random(1);
      dir[i] = 1.;
    }
  }
  
  
  PImage getImage() {
    return cbox;
  }

  void draw() {
    cbob.getBob();
    for (int i=0; i < iMax; i++) {
      pushMatrix();
      translate(xoff[i], yoff[i],0);
      rotateZ(zrot[i].getBob() - 0.5*rotOff);
      rotateX(0.6*HALF_PI*sin(HALF_PI*scale[i]));
      if (scale[i] >= 0.) {
        float theta = HALF_PI*(scale[i]*(0.5+0.5*yoff[i]/height));
        scale(sin(theta));
        noStroke();
        //stroke(apal.getColor(cbob.getBobTail(10*i)));
        fill(apal.getColor(cbob.getBobTail(10*i)));
        box(200);
      }
      scale[i] += dir[i]*inc[i]; 
      if (scale[i] >= 1.) dir[i] = -1.;
      if (scale[i] <= 0.) {
        scale[i] = 0.0;
        xrot[i] = new NoizeBob(0.05,0.01,0.3);
        zrot[i] = new NoizeBob(rotOff,0.01,0.3);
        xoff[i] = random(1)*width;
        yoff[i] = random(1)*height;
        inc[i] = 0.001*random(1);
        dir[i] = 1.;
      }
      popMatrix();
        
    }
  }

  PImage getImageRot() {
    cbox.loadPixels();
    cbob.getBob();
    for (int y = 0; y < height; y++) {
      //println(1.0*y/height);
      color c = apal.getColor(coff + 1.0*(y)/height+cbob.getBobTail(y));
      
      float hue = hue(c);
      float sat = saturation(c);
      float brt = brightness(c);
      for (int x = 0; x < width; x++) {
        cbox.pixels[x+y*width] = color(hue, sat, brt*y/height);
      }
    }
    
    cbox.updatePixels();
    coff -= cinc;
    if (coff <= 0.) coff = 1.0;
    
    return cbox;
  }
}
