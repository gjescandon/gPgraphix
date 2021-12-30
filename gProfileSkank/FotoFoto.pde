class Foto {
PImage[] fotos;
int cnt, sz;
  Foto() {
    sz = 19;
    fotos = new PImage[sz];
    fotos[0] = loadImage("gProfilesPosterized/gProfile01.png");
    
    String pth = "gProfilesPosterized/gProfile";
    for (int i =0 ; i < 19; i++) {
      fotos[i] =  loadImage(pth + nf(i+1,2) + ".png");
    }
  }
  
  Foto(int sz_, String pth_, int offset) {
    sz = sz_;
    fotos = new PImage[sz];
    
    String pth = pth_;
    for (int i =0 ; i < 19; i++) {
 
      fotos[i] =  loadImage(pth.replace("XX", nf(i+offset,4)));
    }
  }

  PImage getNext(){
    cnt++;
    if (cnt >= sz) cnt = 1;
    PImage img = fotos[cnt];
    return img;
  }

  PImage getRand(){
    cnt = floor(random(sz-1));
    return fotos[cnt];
  }
  
  PImage getSame(){
    PImage img = fotos[cnt];
    return img;
  }
    
    
}
