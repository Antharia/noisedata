import processing.sound.*;

SoundFile track;
FFT fft;

int bands = 128;
float[] spectrum = new float[bands];

PFont mono;

int cols = 16;
int rows;
int cell;
int horizontalMargin, verticalMargin;


void setup() {
  size(1900, 1080, P3D);
  cell = floor(width / cols);
  rows = floor(height / cell);
  horizontalMargin = (width % cols) / 2;
  verticalMargin = (height % rows) / 2;
  
  background(0);
  frameRate(60);
  smooth(4);

  // AUDIO SETUP
  track = new SoundFile(this, "track.wav");
  track.play();
  fft = new FFT(this, bands);
  fft.input(track);
  
  // MODULES SETUP
  sphereSetup();
  sampleSetup();

  mono = createFont("Inconsolata.ttf", 14);
  textFont(mono);
}

void draw() {
  fft.analyze();

  background(0);
  translate(horizontalMargin, verticalMargin);
  mainWindow(cell * 1, cell * 1, cell * 14, cell * 10);

  // MODULES DISPLAY
  spectrumWindow(cell * 1, cell * 1, cell * 5, cell * 2);
  sphereWindow(cell * 6, cell * 1, cell * 4, cell * 4);
  sampleWindow(cell * 5, cell * 1, cell * 5, cell * 3);
  solidWindow(cell * 10, cell * 6, cell * 5, cell * 4);
  //cubesWindow(cell * 1, cell * 6, cell * 2, cell * 2);
}

void mainWindow(float x, float y, float w, float h) {
  stroke(255);
  noFill();
  rect(x, y, w, h);
}
