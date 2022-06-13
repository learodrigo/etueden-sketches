const timestamp = () => {
  const now = new Date().toISOString()
  return now
}

const saveImage = (name) => {
  const fileName = `frames/${name}-${timestamp()}-${frameCount}`
  saveFrames(fileName, 'png', 1, 1)
  console.log("Saved: " + fileName)
}
