class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float size;
  color c;
  
  Mover() {
    location = new PVector(random(size/2, width - size/2), random(size/2, height - size/2));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = 20;
    c = color(random(255), random(255), random(255));
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }
  void checkEdges() {
    if (location.x < size/2 || location.x > width - size/2) {
      velocity.x *= -1;
    }
    if (location.y < size/2 || location.y > height - size/2) {
      velocity.y *= -1;
    }
  }
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(location.x, location.y, size, size);
  }
}