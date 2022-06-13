const polygon = (x, y, radius, npoints) => {
  const angle = TWO_PI / npoints

  beginShape()
    for (let a = 0; a < TWO_PI; a += angle) {
      const sx = x + cos(a) * radius
      const sy = y + sin(a) * radius
      vertex(sx, sy)
    }
  endShape(CLOSE)
}
