// TODO
// // faire défiler le texte 

String s = "";
int stringMaxLength = 669; 

void sampleSetup() {
  for (int i = 0; i < stringMaxLength; i++) {
    s += "0";
  }
}

void sampleDisplay(float x, float y, float w, float h, int band) {

  noStroke();
  fill(255, 100);

  stringMaxLength = 669;

  if (fft.spectrum[band] > 0.06) s = "";

  if (fft.spectrum[band] > 0.02) {
    fill(255);
  } else {
    fill(255, 47);
  }

  for (int i = 0; i < 128; i++) {
    s += fft.spectrum[i];
  }
  s = s.substring(0, stringMaxLength);
  text(s, x, y, w, h);
}

void sampleWindow(float x, float y, float w, float h) {
  int band = 10;
  pushMatrix();
  translate(x, y);
  stroke(255);
  noFill();
  rect(x, y, w, h);
  sampleDisplay(x, y, w, h, band);
  popMatrix();
}
