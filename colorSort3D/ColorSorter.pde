class ColorSorter {
  
 color[] carr;
 float[] brarr;
 HashMap<Float, Integer> bmap;
 
 ColorSorter(color[] carrIn) {
   carr = carrIn;
   colorMode(HSB, 255);
   brarr = new float[carrIn.length];
   bmap = new HashMap<Float, Integer>(carrIn.length);
   float bmax = 0.;
   float bmin  = 255.;
   for (int i = 0; i < carrIn.length; i++) {
    brarr[i] = brightness(carr[i]);
    if (brarr[i] > bmax) {
      bmax = brarr[i];
    }
    if (brarr[i] < bmin) {
      bmin = brarr[i];
    }
    bmap.put(brarr[i], i);   
   }   
   println( bmin + " :: " + bmax);
 }
 
 color[] getSortedColors() {
  color[] rArr = new color[carr.length];
  float[] sorted = reverse(sort(brarr));
  
  for (int i = 0; i < carr.length; i++) {
    rArr[i] = carr[bmap.get(sorted[i])];
  }
  //println(sorted.length);  
  return rArr;
  
 }
}
