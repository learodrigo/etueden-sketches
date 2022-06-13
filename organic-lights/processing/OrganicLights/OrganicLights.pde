float angle = 0;

void setup() {
  size(1200, 1200);
  background(0);

  for (int i = 1; i < 10000; i++) {
    IntList sequence = new IntList();
    int n = i;

    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);

    //sequence.append(1);
    sequence.reverse();

    int len = 7;
    angle += 0.06;

    resetMatrix();
    translate(width / 2, height - 550);

    for (int j = 0; j < sequence.size(); j++) {
      float value = sequence.get(j);

      if (value % 4 == 0) {
        rotate(angle);
      } else {
        rotate(-angle);
      }

      strokeWeight(2);
      stroke(255, 5);
      line(0, 0, 0, len * 10);
      translate(0, -len);
    }
  }
  
  noLoop();
}

int collatz(int n) {
  if (n % 2 == 0) {
    return n / 2;
  } else {
    return (n * 5 + 1) / 3;
  }
}

void keyReleased() {
  if (key == 's') {
    saveImage();
  }
}
