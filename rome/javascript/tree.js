class Tree {
  constructor() {
    this.leaves = []
    this.branches = []

    for (let i = 0; i < LEAVES; i++) {
      this.leaves.push(new Leaf())
    }

    const pos = createVector(width / 2, height / 2)
    const dir = createVector(0, -1)

    this.root = new Branch(null, pos, dir)
    this.branches.push(this.root)

    let current = this.root
    let found = false

    while (!found) {
      for (let i = 0; i < this.leaves.length; i++) {
        let d = p5.Vector.dist(current.pos, this.leaves[i].pos)
        if (d < maxDist) {
          found = true
        }
      }

      if (!found) {
        let branch = current.next()
        current = branch
        this.branches.push(current)
      }
    }
  }

  grow() {
    for (let i = 0; i < this.leaves.length; i++) {
      let leaf = this.leaves[i]

      let closestBranch = null
      let recordDist = Infinity

      for (let j = 0; j < this.branches.length; j++) {
        let branch = this.branches[j]
        let d = p5.Vector.dist(leaf.pos, branch.pos)

        if (d < minDist) {
          leaf.reached = true
          break
        } else if (d > maxDist) {
        } else if (closestBranch === null || d < recordDist) {
          closestBranch = branch
          recordDist = d
        }
      }

      if (closestBranch != null) {
        const newDir = p5.Vector.sub(leaf.pos, closestBranch.pos)
        newDir.normalize()
        closestBranch.dir.add(newDir)
        closestBranch.count++
      }
    }

    for (let i = this.leaves.length - 1; i >= 0; i--) {
      if (this.leaves[i].reached) {
        this.leaves.splice(i, 1)
      }
    }

    for (let i = this.branches.length - 1; i >= 0; i--) {
      const branch = this.branches[i]

      if (branch.count > 0) {
        branch.dir.div(branch.count + 1)
        this.branches.push(branch.next())
      }
    }
  }

  show() {
    for (let i = 0; i < this.leaves.length; i++) {
      this.leaves[i].show()
    }

    for (let i = 0; i < this.branches.length; i++) {
      this.branches[i].show()
    }
  }
}
