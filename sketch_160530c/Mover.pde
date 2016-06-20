class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  
  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));;
    topSpeed = 1;
  }
  void update() {
    acceleration = PVector.random2D();
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    checkEdges();
  }
  void checkEdges() {
    location.x = location.x < 0? 0 : (location.x > width? width : location.x);
    location.y = location.y < 0? 0 : (location.y > height? height : location.y);
  }
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
}