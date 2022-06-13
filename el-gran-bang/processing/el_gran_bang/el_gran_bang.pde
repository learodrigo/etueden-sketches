int num = 1000;
ArrayList<Bang> bangs = new ArrayList();

void setup() {
  size(1200, 1200);

  for (int i = 0; i < num; i++) {
    bangs.add(new Bang());
  }
}

void draw() {
  background(0);

  translate(width / 2, height / 2);

  for (Bang s : bangs) {
    s.run();
  }

  //rec();
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
  else if (key == 's') {
    saveImage();
  }
}
