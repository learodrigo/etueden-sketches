class Leaf {
  PVector pos;
  boolean reached;

  Leaf () {
    this.pos = new PVector(random(width - 100), random(height - 100));
    this.reached = false;
  }

  void show () {
    noStroke();
    fill(255, random(5, 30));
    circle(this.pos.x, this.pos.y, random(1,3));
  }
}
