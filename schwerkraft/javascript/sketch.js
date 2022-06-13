const P_NUM = 3000
const A_NUM = 7

let hideTrail = true
const attractors = []
const particles = []

function setup() {
  createCanvas(windowWidth, windowHeight)
  background(0)

  // Atractros
  for (let i = 0; i < A_NUM; i++) {
    attractors.push(
      createVector(
        random(width * 0.2, width * 0.7),
        random(height * 0.2, height * 0.7)
      )
    )
  }

  // Particles
  for (let i = 0; i < P_NUM; i++) {
    const x = random(width * 0.2, width * 0.8)
    const y = random(height * 0.2, height * 0.8)
    particles[i] = new Particle(x, y)
  }
}

function draw() {
  if (hideTrail) background(0)

  for (let a of attractors) {
    strokeWeight(17)
    stroke(0, 0, 0)
    point(a.x, a.y)
  }

  for (let i = 0; i < particles.length; i++) {
    for (let j = 0; j < attractors.length; j++) {
      particles[i].attracted(attractors[j])
    }

    particles[i].update()
    particles[i].show()
  }
}

function mousePressed() {
  attractors.push(createVector(mouseX, mouseY))
}

function keyPressed() {
  if (key === "s") {
    background(0)
    hideTrail = !hideTrail
  } else if (key === "s") {
    background(0)
    hideTrail = !hideTrail
  }
}
