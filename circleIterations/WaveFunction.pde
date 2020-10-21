class WaveFunction {
  float wav, wavInc;
  float amp;
  float offset;
  WaveFunction() {

    float inc = 0.1;
    float amp = 1.0;
    float angleoffset = 0.0;
    init(inc, amp, angleoffset);
  }
  
  WaveFunction(float inc, float amp_, float angleOffset_) {
    init(inc, amp_, angleOffset_);
  }
  
  
  void init(float inc, float amp_, float angleOffset) {
    wav = 0.0;
    wavInc = inc;
    amp = amp_;
    offset = angleOffset;
  }


  float getWav() {
   wav += wavInc;   
   if (wav >= 2.0 * PI) {
     wav = 0.0;
   }
   return amp * cos(wav + offset);
  }

  float getWavDisc() {
   wav += wavInc + random(1.0);   
   if (wav >= 2.0 * PI) {
     wav = 0.0;
   }
   return amp * cos(wav + offset);
  }
 
  
}
