void setup() {
  size(720,720, P3D);
  colorMode(HSB, 1.);
  
}

void draw() {
  background(0);
 rotateX(0.3*sin(0.01*frameCount) - 0.1*PI);
 pushMatrix();
 translate(0.5*width,0.5*height,0);
 float d0 = 300;
 //box(200);
 boxRecurse(d0,0,0, 0);
 boxRecurse(d0,0,0, -1.5*d0);
 boxRecurse(d0,1.5*d0,0, 0);
 boxRecurse(d0,1.5*d0,0, -1.5*d0);
 boxRecurse(d0,-1.5*d0,0, 0);
 boxRecurse(d0,-1.5*d0,0, -1.5*d0);
 //noLoop();
 popMatrix();
}

void boxRecurse(float d, float x, float y, float z) {
 if (d < 20) return;
 float xx = 0.;
 float yy = 0.;
 float zz = 0.;
 float dd = 0.382*d;
 float offset = 0.36;
 float offsetY = 0.36;
 
 pushMatrix();
 xx = x - offset*d;
 yy = y - offsetY*d;
 zz = z - offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();
 
 
 pushMatrix();
 xx = x + offset*d;
 yy = y - offsetY*d;
 zz = z - offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();
 
 pushMatrix();
 xx = x - offset*d;
 yy = y - offsetY*d;
 zz = z + offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();
 
 pushMatrix();
 xx = x + offset*d;
 yy = y - offsetY*d;
 zz = z + offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();
 
 /*
 pushMatrix();
 xx = x + offset*d;
 yy = y + offset*d;
 zz = z + offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();

 pushMatrix();
 xx = x - offset*d;
 yy = y + offset*d;
 zz = z - offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();

 pushMatrix();
 xx = x + offset*d;
 yy = y + offset*d;
 zz = z - offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();
  
 pushMatrix();
 xx = x - offset*d;
 yy = y + offset*d;
 zz = z + offset*d;
 translate(xx, yy, zz);
 box(dd);
 boxRecurse(dd, 0, 0, 0);
 popMatrix();
 
*/  
}
