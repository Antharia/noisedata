float cakeAngleX = 0;
float cakeAngleY = 0;
float cakeAngleZ = 0;

float cakeNoiseFactor = 0;

void cakeDisplay(float w, float h) {
  int nbParts = 5;
  float cakeRadius = w * 4/5;
  stroke(255);
  fill(0);
  float[] energy = new float[nbParts];

  for (int i = 0; i < nbParts; i++) {
    int band = i;
    energy[i] = fft.spectrum[band];
  }
  translate(w / 2, h * 0.482);
  cakeAngleX = map(noise(cakeNoiseFactor), 0, 1, -3, 3);
  cakeAngleY = map(noise(cakeNoiseFactor + 100), 0, 1, -3, 3);
  rotateX(cakeAngleX);
  rotateY(cakeAngleY);
  rotateZ(cakeAngleZ);
  ellipse(0, 0, cakeRadius, cakeRadius);

  for (int i = 0; i < nbParts; i++) {
    float x1 = cos(cakeAngleZ + i * TWO_PI / nbParts) * cakeRadius / 2;
    float y1 = sin(cakeAngleZ + i * TWO_PI / nbParts) * cakeRadius / 2;
    //float x2 = cos(cakeAngleZ + (i + 1) + TWO_PI / nbParts * cakeRadius / 2);
    //float y2 = sin(cakeAngleZ + (i + 1) + TWO_PI / nbParts * cakeRadius / 2);
    beginShape();
    vertex(0, 0, 0);
    vertex(x1, y1, 0);
    vertex(x1, y1, energy[i]);
    vertex(0, 0, energy[i]);
    vertex(0, 0, 0);
    endShape();
    pushMatrix();
    translate(0, 0, energy[i]);
    arc(0, 0, cakeRadius, cakeRadius, i * TWO_PI / nbParts, (i + 1) * TWO_PI / nbParts);
    popMatrix();
  }

  cakeAngleZ += 0.0087;
  cakeNoiseFactor += 0.00657;
}

void cakeWindow(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  stroke(255);
  noFill();
  rect(0, 0, w, h);
  cakeDisplay(w, h);
  popMatrix();
}
