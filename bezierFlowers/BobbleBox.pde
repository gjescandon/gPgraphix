class BobbleBoxPistil{
  BobbleBox bbox1, bbox2, bbox3;
  float rOff, rOffx, rOffy;
  
  BobbleBoxPistil() {
    bbox1 = new BobbleBox();
    bbox2= new BobbleBox();
    bbox3 = new BobbleBox();
  
    rOff = 28.;
    rOffx = rOff * cos(PI/6.);
    rOffy = rOff * sin(PI/6.);    
      
    }
  
  void draw() {
    
    pushMatrix();
    translate(0.5*width, 0.5*height, 13.);
    pushMatrix();
    rotateZ(-0.001*frameCount);
    pushMatrix();
    translate(0., -rOff, 0.);
    bbox1.draw();
    popMatrix();
    pushMatrix();
    translate(rOffx, rOffy, 0.);
    
    bbox2.draw();
    popMatrix();
    pushMatrix();
    translate(-rOffx, rOffy, 0.);
    
    bbox3.draw();
    popMatrix();
    popMatrix();
    popMatrix();
    }
  
  
  
}

class BobbleBox {
  
 float thetax, thetay, thetaz;
 float txInc, tyInc, tzInc;
 AutoPalette apal;
 color c;
 float c0, cInc;
 NoizeBob txbob, tybob, tzbob;
 float sbox;
 
 BobbleBox(){
   sbox = 50.;
   thetax = thetay = thetaz = 0.0;
   txInc = 0.01*random(1);
   tyInc = 0.01*random(1);
   tzInc = 0.01*random(1);
   apal = new AutoPalette(0.3);
   c0 = 0.0;
   cInc = 0.001;
   txbob = new NoizeBob(1,random(1),0.5);
   tybob = new NoizeBob(1,random(1),0.5);
   tzbob = new NoizeBob(1,random(1),0.5);
 }
 
 
 void draw() {
   
  pushMatrix();
  pushMatrix();
  rotateX(0.2*sin(thetax)+ 0.25*PI);
  rotateY(0.2*sin(thetay)+ 0.25*PI);
  rotateZ(0.2*sin(thetaz));
  fill(apal.getColor(c0));
  stroke(apal.getColor(frac(1.5*c0)));
  box(sbox, sbox, sbox);
  popMatrix();
  popMatrix();
  
  thetax += 0.006*txbob.getBob();
  thetay += 0.006*tybob.getBob();
  thetaz += 0.006*tzbob.getBob();
  c0 = frac(c0 + cInc); 
   
 }
 
 float frac(float x) {
  return (x - floor(x)); 
 }
}
