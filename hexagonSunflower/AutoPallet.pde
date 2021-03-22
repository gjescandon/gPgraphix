color[] loadPallet(int cindex, PImage pimg) {
  color[] pallet = new color[cindex];
  for (int i = 0; i < pallet.length; i++) {
   color tc = color(0,0,0,0);
   while (alpha(tc) < 200) {
    tc = pimg.pixels[floor(random(10, pimg.pixels.length - 10))];
   }
   pallet[i] = tc;
  }
  return pallet;
}

int jitterInt(float vin) {
  return floor(vin + random(6));
}
