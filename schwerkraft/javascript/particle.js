// Universival gravitational constant
const UGC = 6.67408

class Particle {
  constructor(x, y) {
    this.acc = createVector()
    this.prev = createVector(x, y)
    this.pos = createVector(x, y)
    this.vel = createVector()
  }

  attracted(target) {
    let force = p5.Vector.sub(target, this.pos)
    let distanceSquared = force.magSq()
    distanceSquared = constrain(distanceSquared, 5, 50)

    if (distanceSquared < 20) {
      force.mult(-10)
    }

    let strength = UGC / (distanceSquared * distanceSquared)
    force.setMag(strength)
    this.acc.add(force)
  }

  update() {
    this.pos.add(this.vel)
    this.vel.add(this.acc)
    this.acc.mult(0)
  }

  show() {
    noFill()
    stroke(255)
    strokeWeight(2)
    line(this.pos.x, this.pos.y, this.prev.x, this.prev.y)

    this.prev.x = this.pos.x
    this.prev.y = this.pos.y
  }
}
