class Whispers {
  
Frame[] frams;
Integer max = 23;
String[] ws,fs;
Integer bpm = 160;
Integer offset;
float offx, offy;
float[] xarr, yarr;

NoizeBob xbob, ybob;

 Whispers(){
   setup();
 }
  
  
  void draw() {
    offx += xbob.getBob();
    offy += ybob.getBob();
    
    for (int i = 0; i < max; i++) {
     
     if (frameCount > i * offset) {
       if (xarr[i] == 0) xarr[i] = offx;
       if (yarr[i] == 0) yarr[i] = offy;
       float xx = offx - xarr[i];
       float yy = offy - yarr[i];
       switch (i%4) {
         case 0:
           xx *= -1;
           yy *= -1;
           break;
         case 1:
           yy *= -1;
           break;
         case 2:
           xx *= - 1;
           break;
         default:
           break;
       }
       pushMatrix();
       translate(xx, yy,0);
       frams[i].draw();
       popMatrix();
     }
    }

  }
  void setup(){
    
  offset = 960;
  fs = new String[7];
  fs[0] = "frame1.png";
  fs[1] = "frame2.png";
  fs[2] = "frame3.png";
  fs[3] = "frame4.png";
  fs[4] = "frame5.png";
  fs[5] = "frame6.png";
  fs[6] = "frame7.png";
  
  ws = new String[17];
  ws[0] = "whispers01.png";
  ws[1] = "whispers02.png";
  ws[2] = "whispers03.png";
  ws[3] = "whispers04.png";
  ws[4] = "whispers05.png";
  ws[5] = "whispers06.png";
  ws[6] = "whispers07.png";
  ws[7] = "whispers08.png";
  ws[8] = "whispers09.png";
  ws[9] = "whispers10.png";
  ws[10] = "whispers11.png";
  ws[11] = "whispers12.png";
  ws[12] = "whispers13.png";
  ws[13] = "whispers14.png";
  ws[14] = "whispers15.png";
  ws[15] = "whispers16.png";
  ws[16] = "whispers17.png";    
  
  frams = new Frame[max];
  xarr = new float[max];
  yarr = new float[max];
  
    for (int i = 0; i < max; i++) {
     frams[i] = new Frame(getWhisper(), getFrame());
     xarr[i] = 0.;
     yarr[i] = 0.;
    }
    
   xbob = new NoizeBob(0.1, 0.01, 0.5);
   ybob = new NoizeBob(0.1, 0.01, 0.5);
   
   
  }
  


String getWhisper() {
  String w = ws[floor(random(17))];
  return w;
}

String getFrame() {
  String f = fs[floor(random(7))];
  return f;
}


}

class Frame {
  float x0, y0;
  float w0,h0;
  float x, y, rot, zoff;
  float xinc, yinc, rinc;
  NoizeBob xbob, ybob, rbob, sbob;
  String ws, fs;
  PImage whisp, fram;
  Integer exp, offset, cntr;
  QuilezFunctions qf;
  
  Frame(String w, String f){
    ws = w;
    fs = f;
    setup();
    
  }
  
  void draw(){
    if (zoff < 0-1920){
      setup();
    }

    x += xbob.getBob() - 0.5;
    y += ybob.getBob() - 0.5;
    zoff = 0 - 0.03*cntr;

    rot = 0.1*(rbob.getBob()-0.5);

    float w = width * sbob.getBob() * qf.expSustainedImpulse(cntr, 1000., 0.05);
    float h = height * sbob.getBobTail(1) * qf.expSustainedImpulse(cntr, 1000., 0.05);

    

    pushMatrix();
      translate(x0+0.5*(width), y0+0.5*height, zoff);

    pushMatrix();
    rotateZ(rot);
    pushMatrix();
    translate(0-x0-0.5*w,0-y0-0.5*h,0);
    image(whisp,x0, y0, w, h);
    image(fram, x0, y0, w, h);
    popMatrix();
    popMatrix();
    popMatrix();
    cntr ++;
    
    
  }
  
  void setup() {
    whisp = loadImage(ws);
    fram = loadImage(fs);
    x0 = 0.5*(width-whisp.width);
    y0 = 0.5*(height-whisp.height);
    w0 =0.8 * width;
    h0 = 0.8 * height;
    rot = 0.0;
    cntr = 0;
    zoff = 0.0;
    x=0.0;
    y=0.0;
    
    xbob = new NoizeBob(1.0, 0.5, 0.5);
    ybob = new NoizeBob(1.0, 0.5, 0.5);
    rbob = new NoizeBob(1.0, 0.01, 0.5);
    sbob = new NoizeBob(2.5, 0.0001, 0.3);
    
    qf = new QuilezFunctions();
  }
  
  
  
}
