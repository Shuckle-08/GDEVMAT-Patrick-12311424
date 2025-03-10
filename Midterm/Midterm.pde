ArrayList<Mover> movers = new ArrayList<Mover>();

PVector blackHole;
float blackHoleSize;
int frameLimit = 200; // Number of frames before reset
int frameCounter = 0;

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, 600, 0, 0, 0, 0, -1, 0);
  background(0);

  resetScene();
}

void draw() {
  background(0);

  for (Mover m : movers) {
    m.moveToBlackHole();
    m.display();
  }

  drawBlackHole();

  frameCounter++;
  if (frameCounter >= frameLimit) {
    resetScene();
  }
}

void drawBlackHole() {
  fill(255);
  noStroke();
  ellipse(blackHole.x, blackHole.y, blackHoleSize, blackHoleSize);
}

void resetScene() {
  blackHole = new PVector(random(-640, 640), random(-360, 360));
  blackHoleSize = 50;

  movers.clear();
  for (int i = 0; i < int(random(100, 500)); i++) {
    movers.add(new Mover(blackHole, blackHoleSize));
  }

  frameCounter = 0;
}
