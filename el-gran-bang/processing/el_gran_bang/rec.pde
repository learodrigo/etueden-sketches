import java.util.Calendar;

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void saveImage() {
  String msg = "frames/el-gran-bang-" + timestamp() + "-" + frameCount + ".png";
  saveFrame(msg);
  println("Saved: " + msg);
}

import com.hamoid.*;
VideoExport videoExport;
final String sketchname = getClass().getName();

void rec () {
  if (frameCount == 1) {
    String videoPath = "frames/" + sketchname + "-" + timestamp() + "-" + frameCount + ".mp4";
    videoExport = new VideoExport(this, videoPath);
    videoExport.setFrameRate(30);
    videoExport.startMovie();
  }

  videoExport.saveFrame();
}
