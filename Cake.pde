float cakeAngleZ = 0;
float cakeNoiseFactor = 0;

void cakeDisplay(float w, float h) {
  int nbParts = 8;
  float radius = w * 4/5;
  stroke(255);
  fill(0);
  float[] energy = new float[nbParts];
  
  for (int i = 0; i < nbParts; i++) {
    //int band = floor(128 / nbParts * i);
    int band = i;
    energy[i] = fft.spectrum[band]; 
  }//fft.spectrum[band];
  translate(w / 2, h * 0.482);
  float cakeAngleX = map(noise(cakeNoiseFactor), 0, 1, -3, 3);
  float cakeAngleY = map(noise(cakeNoiseFactor + 100), 0, 1, -3, 3);
  rotateX(cakeAngleX);
  rotateY(cakeAngleY);
  rotateZ(cakeAngleZ);

  for (int i = 0; i < nbParts; i++) {
    float x1 = cos(cakeAngleZ + i * TWO_PI / nbParts) * radius / 2;
    float y1 = sin(cakeAngleZ + i * TWO_PI / nbParts) * radius / 2;
    float x2 = cos(cakeAngleZ + (i + 1) * TWO_PI / nbParts) * radius / 2;
    float y2 = sin(cakeAngleZ + (i + 1) * TWO_PI / nbParts) * radius / 2;
    line(x1, y1, 0, x1, y1, energy[i] * radius);
    line(x2, y2, 0, x2, y2, energy[i] * radius);
    line(0, 0, 0, 0, 0, energy[i] * radius);
    line(0, 0, energy[i] * radius, x1, y1, energy[i] * radius);
    line(0, 0, energy[i] * radius, x2, y2, energy[i] * radius);
    line(0, 0, 0, x1, y1, 0);
    line(0, 0, 0, x2, y2, 0);
    pushMatrix();
    translate(0, 0, energy[i] * radius);
    arc(0, 0, radius, radius, i * TWO_PI / nbParts, (i + 1) * TWO_PI / nbParts);
    popMatrix();
    ellipse(0, 0, radius, radius);
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
