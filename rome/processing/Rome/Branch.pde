class Branch {
  Branch parent;
  PVector pos;
  PVector dir;
  PVector origDir;
  int count;
  int len;
  int reset;

  Branch(Branch parent, PVector pos, PVector dir) {
    this.parent = parent;
    this.pos = pos;
    this.dir = dir;
    this.origDir = this.dir.copy();
    this.count = 0;
    this.len = 50;
  }

  Branch next() {
    this.dir.normalize();

    PVector nextDir = PVector.mult(this.dir, this.len);
    PVector nextPos = PVector.add(this.pos, nextDir);
    Branch nextBranch = new Branch(this, nextPos, this.dir.copy());

    return nextBranch;
  }

  void reset() {
    this.dir = this.origDir.copy();
    this.reset = 0;
  }

  void show() {
    if (this.parent != null) {
      stroke(255, 10);
      strokeWeight(1);
      line(this.pos.x, this.pos.y, this.parent.pos.x, this.parent.pos.y);
    }
  }
}
