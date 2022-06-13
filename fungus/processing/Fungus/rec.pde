import java.util.Calendar;

final String sketchname = getClass().getName();

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

String pathToSave(String extension) {
  return "frames/" + sketchname + "-" + timestamp() + "-" + frameCount + extension;
}

void saveImage() {
  String filePath = pathToSave(".png");
  saveFrame(filePath);
  println("Saved: " + filePath);
}
