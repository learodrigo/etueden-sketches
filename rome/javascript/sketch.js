// Modeling Trees with a Space Colonization Algorithm paper
// http://algorithmicbotany.org/papers/colonization.egwnp2007.pdf

const LEAVES = 1000

let tree

const minDist = 20
const maxDist = 100

function setup() {
  createCanvas(windowWidth, windowHeight)
  background(0)

  tree = new Tree()
}

function draw() {
  tree.show()
  tree.grow()
}
