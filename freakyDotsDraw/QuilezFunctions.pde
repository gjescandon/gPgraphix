class QuilezFunctions {
  float hash(float x, float y) {
  float ret = sin(x*12.9898 + y*78.233)*43758545.3123;
    return ret - floor(ret);
  }
}
