int P_NUM = 20000;
int A_NUM = 10;

boolean hideTrail = true;
boolean rec = false;

ArrayList<Particle> attractors = new ArrayList();
Particle[] particles = new Particle[P_NUM];

void setup() {
  size(1200, 1200);
  background(0);

  // Atractros
  for (int i = 0; i < A_NUM; i++) {
    Particle attractor = new Particle(
      random(width * 0.2, width * 0.7),
      random(height * 0.2, height * 0.7)
    );

    attractors.add(attractor);
  }

  // Particles
  for (int i = 0; i < P_NUM; i++) {
    float x = random(width * 0.2, width * 0.8);
    float y = random(height * 0.2, height * 0.8);
    particles[i] = new Particle(x, y);
  }
}

void draw() {
  if (hideTrail) background(0);

  for (Particle a : attractors) {
    strokeWeight(17);
    stroke(0, 0, 0);
    point(a.x, a.y);
  }

  for (int i = 0; i < particles.length; i++) {
    for (Particle a : attractors) particles[i].attracted(a);

    particles[i].update();
    particles[i].show();
  }

  if (rec) rec();
}

void keyPressed() {
  if (key == 't') {
    background(0);
    hideTrail = !hideTrail;
  }
  else if (key == 's') {
    saveImage();
  }
  else if (key == 'r') {
    rec = true;
  }
}

void mousePressed() {
  Particle attractor = new Particle(mouseX, mouseY);
  attractors.add(attractor);
  
  println(attractors.size());
}
