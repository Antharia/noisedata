void solidDisplay(float x, float y, float w, float h, int band) {
  float energy = map(fft.spectrum[band], 0, 0.05, 0, 255);    
  noStroke();
  fill(energy);
  rect(x, y, w, h);
}

void solidWindow(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  int nbSolids = 13;
  for (int i = 0; i < nbSolids; i++) {
    float solidWidth = w / nbSolids;
    float solidHeight = h;
    stroke(255);
    noFill();
    rect(solidWidth * i, 0, solidWidth, solidHeight);
    int band = floor(norm(i * 20, 0, nbSolids * 20) * 127); // never go out the spectrum
    solidDisplay(solidWidth * i, 0, solidWidth, solidHeight, band);
  }
  popMatrix();
}
