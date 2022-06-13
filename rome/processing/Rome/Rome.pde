int LEAVES = 200;

Tree tree;

float minDist = 10;
float maxDist = 200;

void setup() {
  size(1200, 1200);
  background(0);

  tree = new Tree();
}

void draw() {
  tree.show();
  tree.grow();
}

void keyReleased() {
  if (key == 's') {
    saveImage();
  }
}
