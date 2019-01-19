import processing.sound.*;

SoundFile track;
FFT fft;

int bands = 128;
float[] spectrum = new float[bands];

PFont mono;

int cols = 24;
int rows;
int cell;
int horizontalMargin, verticalMargin;


void setup() {
  size(800, 600, P3D);
  cell = floor(width / cols);
  rows = floor(height / cell);
  horizontalMargin = (width % cols) / 2;
  verticalMargin = (height % rows) / 2;
  
  background(0);
  frameRate(60);
  smooth(4);

  // AUDIO SETUP
  track = new SoundFile(this, "track4.wav");
  track.play();
  fft = new FFT(this, bands);
  fft.input(track);
  
  // MODULES SETUP
  sphereSetup();
  sampleSetup();

  mono = createFont("Inconsolata.ttf", 12);
  textFont(mono);
}

void draw() {
  fft.analyze();
  // TODO
  // Modifier Circular pour remettre background(0);
  // background(0);
  translate(horizontalMargin, verticalMargin);
  mainWindow(cell * 1, cell * 1, cell * 22, cell * 16);

  // MODULES WINDOWS
  spectrumWindow(cell * 1, cell * 1, cell * 5, cell * 2);
  sphereWindow(cell * 6, cell * 1, cell * 4, cell * 4);
  sampleWindow(cell * 5, cell * 2, cell * 6, cell * 11);
  solidWindow(cell * 14, cell * 1, cell * 8, cell * 1);
  cubesWindow(cell * 1, cell * 4, cell * 3, cell * 3);
  cakeWindow(cell * 4, cell * 5, cell * 6, cell * 6);
  circularWindow(cell * 16, cell * 5, cell * 6, cell * 6);
}

void mainWindow(float x, float y, float w, float h) {
  stroke(255);
  noFill();
  rect(x, y, w, h);
}
