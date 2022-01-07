class Particle {

  PVector velocity;
  float lifespan0 = 56;
  float lifespan;
  
  PShape part;
  float partSize;
  
  PVector gravity = new PVector(0,0.0);


  Particle() {
    partSize = random(3,8);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(sprite);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, sprite.width, 0);
    part.vertex(+partSize/2, +partSize/2, sprite.width, sprite.height);
    part.vertex(-partSize/2, +partSize/2, 0, sprite.height);
    part.endShape();
    
    //rebirth(width/2,height/2);
    //lifespan = random(lifespan0);
    lifespan = -1;
    velocity = new PVector(0., 0.);
    
  }

  PShape getShape() {
    return part;
  }
  
  void rebirth(float x, float y) {
    float a = random(TWO_PI);
    float speed = random(0.5,1.);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    lifespan = random(lifespan0);   
    part.resetMatrix();
    part.translate(x, y); 
  }
  
  boolean isDead() {
    if (lifespan < 0) {
     return true;
    } else {
     return false;
    } 
  }
  

  public void update() {
    lifespan = lifespan - 1;
    velocity.add(gravity);
    
    part.setTint(color(255,lifespan));
    part.translate(velocity.x, velocity.y);
  }
}
