class Bang {
  constructor(mousePressed) {
    this.x = random(-width, width)
    this.y = random(-height, height)
    this.z = random(width * 2)
    this.pz = this.z
    this.speed = 0
    this.mousePressed = mousePressed
  }

  update() {
    this.speed = this.mousePressed
      ? tan(frameCount) * mouseX
      : tan(frameCount) * -1 * (mouseX / 2)

    this.z -= this.speed

    if (this.z < 1) {
      this.x = random(-width, width)
      this.y = random(-height, height)
      this.z = random(width * 2)
      this.pz = this.z
    }
  }

  show() {
    stroke(255)
    strokeWeight(random(3))

    const sx = map(this.x / this.z, 0, 1, 0, width)
    const sy = map(this.y / this.z, 0, 1, 0, height)

    const r = random(map(this.z, 0, width, 16, 1))

    const px = map(this.x / this.pz, 0, 1, 0, width)
    const py = map(this.y / this.pz, 0, 1, 0, height)

    this.pz = this.z

    ellipse(sx, sy, r, r)
    line(px, py, sx, sy)
  }

  run() {
    this.update()
    this.show()
  }
}
