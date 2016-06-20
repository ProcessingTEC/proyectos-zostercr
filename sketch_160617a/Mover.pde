class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  color c;
  float size;
  float rOff, rInc;
  float gOff, gInc;
  float bOff, bInc;
  float tOff, tInc;
  
  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);
    topSpeed = random(1, 15);
    size = 1 / topSpeed * 100 + 10;
    rOff = random(100);
    gOff = random(100);
    bOff = random(100);
    tOff = random(100);
    rInc = random(0.01);
    gInc = random(0.01);
    bInc = random(0.01);
    tInc = random(0.01);
  }
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    PVector rand = PVector.random2D();
    rand.mult(0.5);
    dir.normalize();
    //dir.mult(0.5);
    dir.add(rand);
    
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    checkEdges();
    updateColor();
    display();
  }
  void checkEdges() {
    location.x = location.x < 0? width : (location.x > width? 0 : location.x);
    location.y = location.y < 0? height : (location.y > height? 0 : location.y);
  }
  void updateColor() {
    c = color(noise(rOff) * 255, noise(gOff) * 255, noise(bOff) * 255);
    rOff += rInc;
    gOff += gInc;
    bOff += bInc;
    tOff += tInc;
  }
  void display() {
    noStroke();
    fill(c, noise(tOff) * 255);
    ellipse(location.x, location.y, size, size);
  }
}