// Universival gravitational constant
float UGC = 6.67408;

class Particle {
  float x;
  float y;
  PVector acc;
  PVector prev;
  PVector pos;
  PVector vel;

  Particle(float x, float y) {
    this.acc = new PVector();
    this.prev = new PVector(x, y);
    this.pos = new PVector(x, y);
    this.vel = new PVector();
  }

  void attracted(Particle target) {
    PVector force = PVector.sub(target.pos, this.pos);
    float distanceSquared = force.magSq();
    distanceSquared = constrain(distanceSquared, 5, 50);

    if (distanceSquared < 20) {
      force.mult(-10);
    }

    float strength = UGC / (distanceSquared * distanceSquared);
    force.setMag(strength);
    this.acc.add(force);
  }

  void update() {
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    this.acc.mult(0);
  }

  void show() {
    noFill();
    stroke(255, 10);
    strokeWeight(2);
    line(this.pos.x, this.pos.y, this.prev.x, this.prev.y);

    this.prev.x = this.pos.x;
    this.prev.y = this.pos.y;
  }
}
