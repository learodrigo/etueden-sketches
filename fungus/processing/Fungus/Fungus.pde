int currentCount = 15;
int margin = 50;
int maxCount = 2500;

float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];

float randomR() { return random(1, 7); }
float randomX() { return random(margin, width - margin); }
float randomY() { return random(margin, height - margin); }

void setup() {
  size(1200, 1200);
  background(0);

  for (int i = 0; i < currentCount; i++) {
    r[i] = randomR();
    x[i] = randomX();
    y[i] = randomY();
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;

  beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
  endShape(CLOSE);
}

void draw() {
  float newR = randomR();
  float newX = randomX();
  float newY = randomY();

  // The longest distance is the diagonal
  float closestD = sqrt((width * width) + (height * height));
  int closestIn = 0;

    for (int i = 0; i < currentCount; i++) {
      float newD = dist(newX, newY, x[i] - 1, y[i] - 1);

      if (newD < closestD) {
        closestD = newD;
        closestIn = i;
      }
    }

  float angle = atan2(newY - y[closestIn], newX - x[closestIn]);
  int i = currentCount;
  currentCount++;

  x[i] = x[closestIn] + cos(angle) * (r[closestIn] + newR);
  y[i] = y[closestIn] + sin(angle) * (r[closestIn] + newR);
  r[i] = newR;

  showHistoryPath(newX, newY, newR, closestIn);

  noStroke();
  noFill();
  stroke(255, 10);
  strokeWeight(2);

  fill(255, 10);
  polygon(x[i], y[i], r[i] * 7, int(random(7, 9)));
  circle(x[i], y[i], r[i] * 7);

  noFill();

  circle(x[i], y[i], r[i] * 4);
  circle(x[i], y[i], r[i] * 3);
  circle(x[i], y[i], r[i] * 2);
  circle(x[i], y[i], r[i] * 1);

  stroke(255, 10);
  polygon(x[i], y[i], r[i] * 3, int(random(5, 7)));
  circle(x[i], y[i], r[i] * 3);

  stroke(255, 10);
  polygon(x[i], y[i], r[i] * 5, int(random(6, 8)));
  circle(x[i], y[i], r[i] * 5);

  if (currentCount == maxCount) {
    println("Limit reached: " + maxCount);
    noLoop();
  }
}

void showHistoryPath(float _x, float _y, float _r, int inx) {
  noFill();
  stroke(255, 25);
  strokeWeight(1);
  circle(_x, _y, _r * 2);
  line(_x, _y, x[inx], y[inx]);
}

void keyReleased() {
  if (key == 's') {
    saveImage();
  }
}
