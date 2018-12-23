
float smoothingFactor;
float[] sum = new float[bands];
int scale;

void spectrumDisplay(float w, float h) {
  float barWidth = w/float(bands);

  fill(255);
  noStroke();

  scale = 25;
  smoothingFactor = 0.20;
  
  for (int i = 0; i < bands; i++) {
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;
    float barHeight = -sum[i]*h*scale;
    if (barHeight < -h) barHeight = -h;
    rect(i*barWidth, h, barWidth, barHeight);
  }
}

void spectrumWindow(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  stroke(255);
  noFill();
  rect(0, 0, w, h);
  spectrumDisplay(w, h);
  popMatrix();
}
