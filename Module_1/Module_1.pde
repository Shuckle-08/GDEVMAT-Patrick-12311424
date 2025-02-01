float time = 0;
float amplitude = 50;
float period = 50;

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 /180.0), 0, 0, 0, 0, -1, 0);
}

void draw() {
  background(0);

  drawCartesianPlane();

  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();

  time+=1;
  
  if (keyPressed){
    if (key == 'w' || key == 'W'){
      amplitude += 1;
    }
    if (key == 's' || key == 'S'){
      amplitude -= 1;
    }
    if (key == 'd' || key == 'D'){
      period += 1;
    }
    if (key == 'a' || key == 'A'){
      period -= 1;
    }
  }    
}

void drawCartesianPlane() {
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);

  line(0, 300, 0, -300);
  line(-300, 0, 300, 0);

  for (int i = -300; i <= 300; i += 10) {
    line(i, -3, i, 3);
    line(-3, i, 3, i);
  }
}

void drawLinearFunction() {
  color purple = color(230, 230, 250);
  fill(purple);
  noStroke();

  for (float x = -200; x <= 200; x += 0.1f) {
    circle(x, (-5*x) + 30, 3);
  }
}

void drawQuadraticFunction() {
  color yellow = color(255, 255, 0);
  fill(yellow);
  noStroke();

  for (float x = -200; x <= 200; x += 0.1f) {
    circle(x, (x*x) - (15*x) - 3, 3);
  }
}

void drawSineWave() {
  color pink = color(255, 192, 203);
  fill(pink);
  noStroke();

  for (float x = -300; x <= 300; x += 0.1f) {
    circle(x, amplitude * (float)Math.sin( ((2*PI)/period) * (x + time)) + 0, 5);
  }
}
