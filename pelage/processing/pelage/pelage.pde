boolean debug = false;
boolean rec = false;

int PARTICLE_NUMBERS = 10000;

int cols, rows;
float inc = 0.1;
float zoff = 0;

int scl = 20;

ArrayList<Hair> hairs = new ArrayList<Hair>();
PVector[][] flowField;

void setup() {
  size(1200, 1200);
  background(0, 10);

  cols = floor(width / scl);
  rows = floor(height / scl);

  for (int i = 0; i < PARTICLE_NUMBERS; i++) {
    hairs.add(new Hair());
  }

  flowField = new PVector[cols][rows];
}

void draw() {
  setFlowField();

  for (Hair h : hairs) {
    h.run(flowField);
  }
  
  if (rec) {
    rec();
  }
}

void setFlowField() {
  float yoff = 0;

  for(int y = 0; y < rows; y++) {
    float xoff = 0;

    for(int x = 0; x < cols; x++) {
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(angle);

      debugger(v, x, y);

      v.setMag(1);
      flowField[y][x] = v;
      xoff += inc;
    }

    yoff += inc;
    zoff += 0.003;
  }
}

void keyPressed () {
  switch (key) {
    case 'd':
      debug = !debug;
      break;
    case 'b':
      background(0);
      break;
    case ' ':
      noLoop();
      break;
    case 's':
      saveImage();
      break;
    case 'r':
      rec = true;
      break;
  }
}


void debugger(PVector v, int x, int y) {
  if (debug) {
    stroke(0, 255, 0, 10);
    strokeWeight(1);
    push();
      translate(x * scl, y * scl);
      rotate(v.heading());
      line(0, 0, scl, 0);
    pop();
  }
}
