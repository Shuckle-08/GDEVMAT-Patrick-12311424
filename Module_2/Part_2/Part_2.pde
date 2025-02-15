void setup(){
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw(){
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));
  int alpha = int(random(10, 100));

  float gaussian = randomGaussian();
  float standardDeviation = 360;
  float mean = 0;

  float circleGaussian = randomGaussian();
  float circleSTD = 50;
  float circleMean = 5;

  float x = standardDeviation * gaussian + mean;
  float y = random(-510, 510);
  float extent = circleSTD * circleGaussian + circleMean;

  noStroke();

  fill(r, g, b, alpha);
  circle(x, y, extent);
}
