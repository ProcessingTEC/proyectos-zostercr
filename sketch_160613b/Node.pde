class Node {
  private PVector pos;
  private Node left;
  private Node right;
  
  public Node(float x, float y) {
    pos = new PVector(x, y);
    left = null;
    right = null;
  }
  public void setLeft(Node left) {
    this.left = left;
  }
  public void setRight(Node right) {
    this.right = right;
  }
  public Node getLeft() {
    return left;
  }
  public Node getRight() {
    return right;
  }
  public PVector getPos() {
    return pos;
  }
}