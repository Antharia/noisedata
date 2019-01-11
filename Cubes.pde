float cubesAngle;

void cubesDisplay(int w, int h, int b) {
  fill(0);
  stroke(255);
  float energy = fft.spectrum[b];
  float smoothingFactor = 0.14;
  translate(w/2, h/2);
  pushMatrix();
  rotateY(cubesAngle);
  rotateX(energy * smoothingFactor);
  box(h/2, h/2, w/2 * energy);
  popMatrix();
  pushMatrix();
  rotateX(cubesAngle);
  rotateZ(energy*smoothingFactor);
  box(h/3, h/3, w/3 * energy);
  popMatrix();
  cubesAngle += 0.010;
}

void cubesWindow(int x, int y, int w, int h) {
  int band = 2;
  pushMatrix();
  translate(x, y);
  noFill();
  stroke(255);
  rect(0, 0, w, h);
  cubesDisplay(w, h, band);
  popMatrix();
}
