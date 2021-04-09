class LlamaWalk {
  PImage ll;
  float h0, w0;
  float sinc, foff;
  NoizeBob zotBob;
  int finc;
  
  LlamaWalk() {
    ll = loadImage("llama_trans.png");
    ll = loadImage("llama3_foreground_blue.png");
    w0 = h0 = 0.0;
    sinc = 0.0001;
    zotBob = new NoizeBob(1.0, 0.001, 0.4);
    foff = 2000.;
    finc =0;
  }
  
  
  void draw() {
    
    float xoff = 0.9*(1.-w0)*width;
    xoff = 0;
    float yoff = (1.- 2* h0)*height;
     /*
     
     1. zoom in
     2. walk around the frame
     3. zoom out
     
     */
   
   if (w0 < 0.5) {
       w0 += sinc;
       h0 += sinc;
       foff += 1;
     } else {
       
      // rotate
       //rotateZ(zotBob.getBob());
       rotateZ(0.01*(frameCount - foff));
     }
       image(ll, xoff, yoff, w0*ll.width, h0*ll.height);
       
     
  /*
  //translate(xoff, yoff, 0.);
     translate(0.5*(width -w0*ll.width), 0.5*(height -h0*ll.height),0);
     pushMatrix();
     rotateZ(zotBob.getBob());
     translate(0- 0.5*(width -w0*ll.width), 0 - 0.5*(height -h0*ll.height),0);
     image(ll, 0., 0., w0*ll.width, h0*ll.height);
     popMatrix();
     
*/
  }
}
