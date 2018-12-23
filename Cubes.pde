float cubesAngle;

void cubesDisplay(int w, int h, int b) {
  float smoothingFactor = 0.34;
  
  fill(0);
  stroke(255);
  float energy = fft.spectrum[b];    
  translate(w/2, h/2);
  rotateY(cubesAngle * smoothingFactor);
  box(40);
  cubesAngle += 0.010;
}

void cubesWindow(int x, int y, int w, int h) {
  int band = 95;
  
  pushMatrix();
  translate(x, y);
  noFill();
  stroke(255);
  rect(0, 0, w, h);
  cubesDisplay(w, h, band);
  popMatrix();
}
