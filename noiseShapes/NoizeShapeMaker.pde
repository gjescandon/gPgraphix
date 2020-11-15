class NoizeShape {
  
  float node = 8.0;
  PShape nshape;
  NoizeBob ybob1, ybob2;
  NoizeBob_2D zzbob;
  
  float poff;
  float xoff;
  float halfY = 0.5*height;
  
  float[] xvals;
  float[] yvals;
  AutoPalette apal;
  float cc, cinc;
  QuilezFunctions qf;
  
  NoizeShape() {
    setup();
    apal = new AutoPalette();
    cc = 0.0;
    cinc = 0.0001;
    qf = new QuilezFunctions();
    
  }
  
  void drawRotating(float toff) {
      float theta = 0.0007*frameCount;
      float ss = 1.0 + 0.25*(1-cos(4.*(theta+toff)));
      
      // 1.
      pushMatrix();
      
      translate(0.5*width,0.5*height,0);
      
      scale(ss);
      pushMatrix();
      rotateZ(theta + toff);
      pushMatrix();
      translate(0.0-0.5*width,0.0-0.5*height,0);
      this.draw();
      popMatrix();
      popMatrix();
      popMatrix();

  }
  void draw() {
    //drawPoles(ps, 0, width);
    float q = node;
    float d = 1.0*width/q/q/q;
    
    for (int i = 0; i < q; i++) {
      for (int j = 0; j < q; j++) {
        for (int k = 0; k < q; k++) {
          float hh = 200.;
          hh += 100.* d * (ybob1.getBobTail(i) + (ybob1.getBobTail(i+1)-ybob1.getBobTail(i))*((j*q+k))/(q));
          hh += 50.*d*(ybob2.getBobTail(j) + (ybob2.getBobTail(j+1)-ybob2.getBobTail(j))*((k)));
          //hh += 1.*d*bob3.getBobTail(k);
          xvals[floor(i*q*q+j*q+k)] = (i*q*q+j*q+k)*d;
          yvals[floor(i*q*q+j*q+k)] = hh;
        }
      }
    }
    PShape ns = createShape();
    color ccc = apal.getColor50(cc);
    ns.setFill(ccc);
    ns.setStroke((apal.getColor(cc+0.5)));
    
    cc += cinc;
    float k = 2+10*(1-sin(0.003*frameCount + poff*TWO_PI));
    k = floor(10*k);
    k = k/10;
    ns.beginShape();
    if (frameCount % 23 == 0) {
      ybob1.getBob();
      ybob2.getBob();
    }
    //ns.vertex(0,0);
    int nnn = floor(node*node*node);
    float zzbobOff = zzbob.getBob();
    for (int i = 0; i < nnn; i++) {
     ns.vertex(xvals[i], 0.5*height - zzbobOff * qf.parabola(1.0*i/nnn,k)*yvals[i]);
    }
    for (int i = 0; i < nnn ; i++) {
     ns.vertex(width - xvals[i], 0.5*height + zzbobOff * qf.parabola(1.0*i/nnn,k)*yvals[i]);
    }
    //ns.vertex(0,0);
    ns.endShape();
    
    shape(ns,0,0.5*height,width, 200); 
  }
  
  
  void setup() {
    xoff = width/(node);
    float binc = 0.009;
    float boff = 900;
    float bfall = 0.9;
    int nnn = floor(node*node*node);
    xvals = new float[nnn];
    yvals = new float[nnn];
    
    ybob1 = new NoizeBob(boff, binc, bfall);
    ybob2 = new NoizeBob(boff, binc, bfall);
    
    zzbob = new NoizeBob_2D();
    poff = random(1);
  }
  
}
