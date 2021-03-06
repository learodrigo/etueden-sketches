let currentCount = 10
const margin = 50
const maxCount = 3000

const x = Array(maxCount)
const y = Array(maxCount)
const r = Array(maxCount)

const randomR = () => random(1, 7)
const randomX = () => random(margin, width - margin)
const randomY = () => random(margin, height - margin)

function setup() {
  createCanvas(1200, 1200)
  background(0)

  for (let i = 0; i < currentCount; i++) {
    r[i] = randomR()
    x[i] = randomX()
    y[i] = randomY()
  }
}

function polygon(x, y, radius, npoints) {
  let angle = TWO_PI / npoints

  beginShape()
  for (let a = 0; a < TWO_PI; a += angle) {
    const sx = x + cos(a) * radius
    const sy = y + sin(a) * radius
    vertex(sx, sy)
  }
  endShape(CLOSE)
}

function draw() {
  const newR = randomR()
  const newX = randomX()
  const newY = randomY()

  // The longest distance is the diagonal
  let closestD = sqrt(width * width + height * height)
  let closestIn = 0

  for (let i = 0; i < currentCount; i++) {
    const newD = dist(newX, newY, x[i] - 1, y[i] - 1)

    if (newD < closestD) {
      closestD = newD
      closestIn = i
    }
  }

  const angle = atan2(newY - y[closestIn], newX - x[closestIn])
  let i = currentCount
  currentCount++

  x[i] = x[closestIn] + cos(angle) * (r[closestIn] + newR)
  y[i] = y[closestIn] + sin(angle) * (r[closestIn] + newR)
  r[i] = newR

  showHistoryPath(newX, newY, newR, closestIn)

  noStroke()
  noFill()
  stroke(255, 10)
  strokeWeight(2)

  fill(255, 10)
  polygon(x[i], y[i], r[i] * 7, int(random(7, 9)))

  noFill()

  circle(x[i], y[i], r[i] * 4)
  circle(x[i], y[i], r[i] * 3)
  circle(x[i], y[i], r[i] * 2)
  circle(x[i], y[i], r[i] * 1)

  stroke(255, 100)
  polygon(x[i], y[i], r[i] * 3, int(random(5, 7)))

  stroke(255, 50)
  polygon(x[i], y[i], r[i] * 5, int(random(6, 8)))

  stroke(255, 40)

  if (currentCount == maxCount) {
    console.log("Limit reached: " + maxCount)
    noLoop()
  }
}

const showHistoryPath = (_x, _y, _r, inx) => {
  noFill()
  stroke(255, 75)
  strokeWeight(1)
  circle(_x, _y, _r * 2)
  line(_x, _y, x[inx], y[inx])
}

function keyReleased() {
  if (key == "s") {
    const msg = "fungus-" + frameCount + ".png"
    saveFrame(msg)
    console.log("Saved: " + msg)
  }
}
