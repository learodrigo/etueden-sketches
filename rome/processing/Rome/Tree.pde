class Tree {
  ArrayList<Leaf> leaves;
  ArrayList<Branch> branches;
  Branch root;

  Tree() {
    this.leaves = new ArrayList<Leaf>();
    this.branches  = new ArrayList<Branch>();

    for (int i = 0; i < LEAVES; i++) {
      this.leaves.add(new Leaf());
    }

    PVector pos = new PVector(width/2, height/2);
    PVector dir = new PVector(0, 1);

    this.root = new Branch(null, pos, dir);
    this.branches.add(this.root);

    Branch current = this.root;
    boolean found = false;

    while (!found) {
      for (int i = 0; i < this.leaves.size(); i++) {
        float d = PVector.dist(current.pos, this.leaves.get(i).pos);

        if (d < maxDist) {
          found = true;
        }
      }

      if (!found) {
        Branch branch = current.next();
        current = branch;
        this.branches.add(current);
      }
    }
  }

  void grow () {
    for (int i = 0; i < this.leaves.size(); i++) {
      Leaf leaf = this.leaves.get(i);

      // Trackers
      Branch closestBranch = null;
      double recordDist = Double.POSITIVE_INFINITY;

      for (int j = 0; j < this.branches.size(); j++) {
        Branch branch = this.branches.get(j);
        float d = PVector.dist(leaf.pos, branch.pos);

        if (d < minDist) {
          leaf.reached = true;
          break;
        } else if (d > maxDist) {

        } else if (closestBranch == null || d < recordDist) {
          closestBranch = branch;
          recordDist = d;
        }
      }

      if (closestBranch != null) {
        PVector newDir = PVector.sub(leaf.pos, closestBranch.pos);
        newDir.normalize();
        closestBranch.dir.add(newDir);
        closestBranch.count++;
      }
    }

    for (int i = this.leaves.size() - 1; i >= 0; i--) {
      if (this.leaves.get(i).reached) {
        this.leaves.remove(i);
      }
    }

    for (int i = this.branches.size() - 1; i >= 0; i--) {
      Branch branch = this.branches.get(i);

      if (branch.count > 0) {
        branch.dir.div(branch.count + 1);
        this.branches.add(branch.next());
      }
    }
  }

  void show () {
    for (int i = 0; i < this.leaves.size(); i++) {
      this.leaves.get(i).show();
    }

    for (int i = 0; i < this.branches.size(); i++) {
      this.branches.get(i).show();
    }
  }
}
