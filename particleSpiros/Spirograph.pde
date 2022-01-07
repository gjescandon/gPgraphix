class Spirograph {
 float r1, r2, r3;
 float n1, n2, n3;
 float ss = 10.0;
 float ssMax = 25;
 color sColor, fColor;
 float offx, offy; 
 int delay;
 float ssR;
 float strokeOff, strokeInc;
 boolean hasStutter = false;
 int negativeN = 1;
 float sred, sblu, sgrn;
 float theta, thetaInc;
 Point pp;
 
 Spirograph(float r1_,float r2_,int n1_,int n2_) {
   r1 = r1_;
   r2 = r2_;
   n1 = negativeN * n1_;
   n2 = n2_;
   fColor = color(204, 102, 0);
   sColor = color(0, 0, 124);
   offx = width/2 + random(-width/10, width/10);
   offy = height/3 * random (0.8, 1.2);
   delay = 0;
   ssR = 1.0;
   
   theta = 0.;
   thetaInc = 0.01;
 }
 
 

 Spirograph(SpiroSeed seed, color sColor_, color fColor_, int delay_) {
   r1 = seed.getR1();
   r2 = seed.getR2();
   //n1 = negativeN * seed.n1;
   n1 = seed.getN1();
   n2 = seed.getN2();

   //r2 = r1 + floor(random(-2,2));

   sColor = sColor_;
   offx = width/2;//+ random(-10, 10);
   offy = height/3;// * random (0.8, 1.2);
   delay = delay_;
   ssR = 0.0;
   ssMax = width / (2 * (r1 + r2));
   strokeOff = 0.0;
   strokeInc = 0.01;
   sred = 0.0; red(sColor);
   sgrn = green(sColor);
   sblu = blue(sColor);
   
   theta = 0.;
   thetaInc = 0.01;
   
 }  
 
 Spirograph(float r1_,float r2_,int n1_,int n2_, color sColor_, color fColor_, int delay_, float ssMax_) {
   r1 = r1_;
   r2 = r2_;
   n1 = negativeN * n1_;
   n2 = n2_;
   fColor = fColor_;
   sColor = sColor_;
   offx = 0; //width/2 + random(-10, 10);
   offy = 0; // height/3 * random (0.8, 1.2);
   delay = 24 * delay_;
   ssR = 0.0;
   ssMax = ssMax_;
 }

 Spirograph(float r1_,float r2_,int n1_,int n2_, color sColor_, color fColor_, int delay_) {
   r1 = r1_;
   r2 = r2_;
   n1 = negativeN * n1_;
   n2 = n2_;
   fColor = fColor_;
   sColor = sColor_;
   offx = width/2;//+ random(-10, 10);
   offy = height/3;// * random (0.8, 1.2);
   delay = 24 * delay_;
   ssR = 0.0;
 }
  
  void draw() {
    if (frameCount < delay) {
      return;
    }
    
   r3 = 20 * mouseX / width;
   n3 = round(20 * cos( PI * mouseY / height));   
   // -3 looks good
      
    pushMatrix();
    
    if(hasStutter){
       /* 
      if (offx < width/3) {
        offx = offx+ random(-1, 1);
      } else { 
        offx = offx+ random(-1, 1);
      }
      */
      if (offx > 0.3 * width) {
        offx = offx+ random(-1, 0);
      }
      if (offy > 0.6 * height) {
        offy = offy +  random(-1, 0);
      }
    }
    
    if (offy > 0.9 * height) {
      offy = 0.6 * height;
    }
    translate(offx, offy);
    
    pushMatrix();
    
    fill(0.0, green(fColor), blue(fColor), 24);

    if (sred < 255) {
      sred += 1.0;
    }
    if (sgrn > 0.0) {
      sgrn -= 1.0;
    }
    
    stroke(sred, sgrn, sblu);
    strokeWeight(3 + 10 * noise(strokeOff));
    rotate(2.0 *PI * ssR);
    beginShape();
    
    ss = abs(ss * 1.003);
    if (ss > ssMax) {
      ss = ssMax;
    }
    
    //r2 = floor(r1 * 10 * (mouseX - 0.5 * width) / width);
    //n1 = floor( n2 * 10 * (mouseY - 0.5 * height) / height);
    ssMax = 0.8 * width / (2 * (r1 + abs(r2)));
    
    //println(r1 + " " + r2 + " " + n1 + " " + n2 + " " + ssMax + " " + ss);
    
    for (float theta = 0; theta < 2*PI; theta += thetaInc) {
     Point pp = getPoint(theta);
     //vertex(offx - ss * x, offy + ss * y);
     vertex(pp.xx,  ss * pp.yy);
    }  
    endShape(CLOSE);
    popMatrix();
    popMatrix();
    ssR = ssR + 0.001;
    strokeOff += strokeInc;
  }
  
  Point getPoint(float theta) {
     float x = r1 * cos(n1 * theta) + r2 * cos(n2 * theta);// + r3 * cos(n3 * theta);
     float y = r1 * sin(n1 * theta) + r2 * sin(n2 * theta);// + r3 * sin(n3 * theta) ;
     Point pp = new Point(ss *x, ss * y);
    return pp;
  }
  

}
