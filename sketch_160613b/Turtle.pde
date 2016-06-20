class Turtle {
  private float x;
  private float y;
  private float heading;
  private PenState pen;
  private color c;
  
  public Turtle(float x, float y, float heading, color c) {
    this.x = x;
    this.y = y;
    this.heading = heading;
    this.c = c;
    this.pen = PenState.DOWN;
  }
  public Turtle() {
    this(0, 0, 0, color(0, 0, 0));
  }
  public void right(float angle) {
    heading = (heading - angle) % TWO_PI;
  }
  public void left(float angle) {
    right(-angle);
  }
  public void forward(float len) {
    float xOff = cos(heading) * len;
    float yOff = -sin(heading) * len;
    float newX = x + xOff;
    float newY = y + yOff;
    if (pen == PenState.DOWN) {
      line(x, y, newX, newY);
    }
    x = newX;
    y = newY;
  }
  public void back(float len) {
    forward(-len);
  }
  public void setX(float x) {
    this.x = x;
  }
  public void setY(float y) {
    this.y = y;
  }
  public void setPos(float x, float y) {
    this.x = x;
    this.y = y;
  }
  public void setHeading(float heading) {
    this.heading = heading;
  }
  public void reset() {
    x = 0;
    y = 0;
    heading = 0;
    c = color(0, 0, 0);
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public void penUp() {
    pen = PenState.UP;
  }
  public void penDown() {
    pen = PenState.DOWN;
  }
}