class QuilezFunctions {
  // // https://www.iquilezles.org/www/articles/functions/functions.htm

  
  
  float hash(float x, float y) {
  float ret = sin(x*12.9898 + y*78.233)*43758545.3123;
    return ret - floor(ret);
  }
  
  
  /*
  float random (float[] st) {
      float x2 = 47.5453123 + 10.*sin(0.01*u_time)+ 10.*cos(0.01*u_time);
      return fract(sin(dot(st.xy,
                           vec2(159.9898,78.233)))*
          x2);
  }
  */
  
  float almostIdentity( float x )
  {
      return x*x*(2.0-x);
  }
  
  float almostIdentity( float x, float m, float n )
  {
      // n :: zero value
      // m :: y(m) = x
      //if( x>m ) return x;
      float a = 2.0*n - m;
      float b = 2.0*m - 3.0*n;
      float t = x/m;
      if( x>m ) 
      {
          return x;
      } else {
        return (a*t + b)*t*t + n;
      }
  }
  
  float almostIdentityDos( float x, float n )
  {
      return sqrt(x*x+n);
  }
  
  float cubicPulse( float c, float w, float x )
  {
      // REPLACES smoothstep(c-w,c,x)-smoothstep(c,c+w,x)
      x = abs(x - c);
      //if( x>w ) return 0.0;
      //x /= w;
      //return 1.0 - x*x*(3.0-2.0*x);
      float ret = 0.;
      if (x < w) {
          x /= w;
          ret = 1.0 - x*x*(3.0-2.0*x);
      }
      return ret;
  
  }
  
  float expImpulse( float x, float k )
  {
      float h = k*x;
      return h*exp(1.0-h);
  }
  
  
  
  float expStep( float x, float k, float n )
  {
      // n : power (positive > 1)
      // k : cross over 1/xx
      return exp( -k*pow(x,n) );
  }
  
  
  float expSustainedImpulse( float x, float f, float k )
  {
      // f: release
      // k: attack
      float s = max(x-f,0.0);
      return min( x*x/(f*f), 1+(2.0/f)*s*exp(-k*s));
  }
  
  float gain(float x, float k) 
  {
      float a = 0.5*pow(2.0*((x<0.5)?x:1.0-x), k);
      return (x<0.5)?a:1.0-a;
  }
  
  float parabola( float x, float k )
  {
      return pow( 4.0*x*(1.0-x), k );
  }
  
  float pcurve( float x, float a, float b )
  {
      float k = pow(a+b,a+b) / (pow(a,a)*pow(b,b));
      return k * pow( x, a ) * pow( 1.0-x, b );
  }
  
  
  float quaImpulse( float k, float x )
  {
      return 2.0*sqrt(k)*x/(1.0+k*x*x);
  }
  
  float sinc( float x, float k )
  {
      float a = PI*(k*x-1.0);
      return sin(a)/a;
  }
  
}
