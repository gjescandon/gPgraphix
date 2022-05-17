class GeoFunctions {
  
 float getGolden() {
   // golden ratio
  return 1.618033; 
 }
 

 GPoint getPerp(float ax, float ay, float bx, float by) {
  GPoint p1 = new GPoint(ax, ay);
  GPoint p2 = new GPoint(bx, by);
  
  float ss = getLen(p1, p2);
  float theta = getAtan(p1, p2);
  
  
  float xx = ss * cos(theta - HALF_PI);
  float yy = ss * sin(theta - HALF_PI);
  /*
  if (theta) {
   xx = ss * cos(theta - HALF_PI);
   yy = ss * sin(theta - HALF_PI);
    
  }
*/
  return new GPoint(xx, yy);
 }

GPoint getPerpLen(float ax, float ay, float bx, float by, float len) {
  GPoint p1 = new GPoint(ax, ay);
  GPoint p2 = new GPoint(bx, by);
  
  float ss = getLen(p1, p2);
  float theta = getAtan(p1, p2);
  
  
  float xx = len * cos(theta - HALF_PI);
  float yy = len * sin(theta - HALF_PI);
  /*
  if (theta) {
   xx = ss * cos(theta - HALF_PI);
   yy = ss * sin(theta - HALF_PI);
    
  }
*/
  return new GPoint(xx, yy);
 }


 
 
 float getAtan(GPoint p1, GPoint p2) {
    return atan((p2.getY() - p1.getY())/(p2.getX() - p1.getX()));
 }
 float getLen(GPoint p1, GPoint p2) {
   return sqrt(sq(p2.getY() - p1.getY()) + sq(p2.getX() - p1.getX())); 
 }
}


class GPoint{
 float x,y;
 
 GPoint(float xin, float yin) {
   x = xin;
   y = yin;
 }
 
 float getX(){
   return x;
 }
 float getY(){
   return y;
 }
  
  
}
