const inc = 0.1
const scl = 20
const PARTICLES = 200000

let cols, rows
let zoff = 0
let debug = false

let hairs = []
let flowField

function setup() {
  createCanvas((windowHeight - 20) * 2, windowHeight - 20)
  background(0)

  cols = floor(width / scl)
  rows = floor(height / scl)

  for (let i = 0; i < PARTICLES; i++) {
    hairs.push(new Hair())
  }

  flowField = new Array(cols * rows)
}

function draw() {
  background(0, 10)

  let yoff = 0
  for (let y = 0; y < rows; y++) {
    let xoff = 0

    for (let x = 0; x < cols; x++) {
      const index = x + y * cols
      const angle = noise(xoff, yoff, zoff) * TWO_PI * 4
      const v = p5.Vector.fromAngle(angle)

      ddebugger(v, x, y)

      v.setMag(0.1)
      flowField[index] = v
      xoff += inc
    }

    yoff += inc
    zoff += 0.0002
  }

  for (let h of hairs) {
    h.run(flowField)
  }
}

function keyPressed() {
  switch (key) {
    case "d":
      debug = !debug
      break
    case "b":
      background(0)
      break
    case " ":
      noLoop()
      break
    case "s":
      saveImage("pelage");
      break
  }
}

function ddebugger(v, x, y) {
  if (debug) {
    strokeWeight(2)
    stroke(0, 255, 0)
    push()
    translate(x * scl, y * scl)
    rotate(v.heading())
    line(0, 0, scl, 0)
    pop()
  }
}
