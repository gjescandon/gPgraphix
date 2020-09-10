class ColorSorter {
  
 color[] carr;
 float[] brarr;
 HashMap<Float, Integer> bmap;
 
 ColorSorter(color[] carrIn) {
   carr = carrIn;
   colorMode(HSB, 255);
   brarr = new float[carrIn.length];
   bmap = new HashMap<Float, Integer>(carrIn.length);
   for (int i = 0; i < carrIn.length; i++) {
    brarr[i] = brightness(carr[i]);
    bmap.put(brarr[i], i);   
   }
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
