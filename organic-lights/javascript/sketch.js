let angle = 0

function setup() {
  createCanvas(800, 800)
  background(0)

  for (let i = 1; i < 10000; i++) {
    let sequence = []
    let n = i

    do {
      sequence.push(n)
      n = collatz(n)
    } while (n !== 1)

    sequence.push(1)
    sequence.reverse()

    let len = 7
    angle += 0.06

    resetMatrix()
    translate(width / 2, height - 150)

    for (let j = 0; j < sequence.length; j++) {
      let value = sequence[j]

      if (value % 2 == 0) {
        rotate(angle)
      } else {
        rotate(-angle)
      }

      strokeWeight(2)
      stroke(255, 5)
      line(0, 0, 0, len)
      translate(0, -len)
    }
  }

  noLoop()
}

const collatz = (n) => {
  if (n % 2 == 0) {
    return n / 2
  } else {
    return (n * 3 + 1) / 2
  }
}
