float angle = 0;
float radius;
int nbEllipses = 4;
float[] speeds = new float[nbEllipses];

void sphereSetup() {
  for (int i = 0; i < nbEllipses; i++) {
    speeds[i] = random(10)/10;
  }
  
}

void sphereDisplay(float w, float h, int band) {
  stroke(255);
  fill(255, 15);

  float energy = fft.spectrum[band];
  
  pushMatrix();
  translate(w/2, h/2);
  for (int i=0; i < nbEllipses; i++) {
    pushMatrix();
    rotateY(angle * noise(i+energy));
    rotateX(angle * speeds[i] * noise(i+energy));
    ellipse(0, 0, w-(w/10), h-(h/3));
    popMatrix();
    angle += 0.02;
  }
  popMatrix();
}

void sphereWindow(float x, float y, float w, float h) {
  int band = 35;
  pushMatrix();
  translate(x, y);
  stroke(255);
  noFill();
  rect(0, 0, w, h);
  sphereDisplay(w, h, band);
  popMatrix();
}
