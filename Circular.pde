float circularAngle = 0;

//TODO
// Mettre les lignes dans un tableau
void circularDisplay(float w, float h) {
   strokeWeight(2);
   int maxBands = 8;
   float circularRadius = w / 2;
   translate(w / 2, h / 2);
   for (int i = 0; i < maxBands; i++) {
      stroke(map(fft.spectrum[i], 0, 1, 0, 255));
      float x1 = cos(circularAngle) * circularRadius;
      float y1 = sin(circularAngle) * circularRadius;
      circularRadius -= w / 2 / maxBands;
      float x2 = cos(circularAngle) * circularRadius;
      float y2 = sin(circularAngle) * circularRadius;
      line(x1, y1, x2, y2);
   }
   circularAngle += 0.0080;
}

void circularWindow(float x, float y, float w, float h){
  pushMatrix();
  translate(x, y);
  stroke(255);
  noFill();
  rect(0, 0, w, h);
  circularDisplay(w, h);
  popMatrix();
}
