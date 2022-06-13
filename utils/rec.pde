import java.util.Calendar;
import com.hamoid.*;

VideoExport videoExport;
final String sketchname = getClass().getName();

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

String pathToSave(String extension) {
  return  "frames/" + sketchname + "-" + timestamp() + "-" + frameCount + extension;
}

void saveImage() {
  String filePath = pathToSave(".png");
  saveFrame(filePath);
  println("Saved: " + filePath);
}

void rec () {
  if (frameCount == 1) {
    String videoPath = pathToSave(".mp4");
    videoExport = new VideoExport(this, videoPath);
    videoExport.setFrameRate(30);
    videoExport.startMovie();
  }

  videoExport.saveFrame();
}
