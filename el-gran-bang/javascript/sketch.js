const num = 800
const bangs = []

function setup() {
  createCanvas(windowWidth, windowHeight)

  for (let i = 0; i < num; i++) {
    bangs.push(new Bang(function mousePressed() {}))
  }
}

function draw() {
  background(0)

  translate(width / 2, height / 2)

  for (const b of bangs) {
    b.run()
  }
}

function keyPressed() {
  if (key === " ") {
    noLoop()
  }
}
