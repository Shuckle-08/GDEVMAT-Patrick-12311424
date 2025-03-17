int numWalkers = 8;
Walker[] walkers = new Walker[numWalkers];
PVector accelerationForce = new PVector(0.2, 0);
float frictionCoefficient = 0.01;
float midScreen;

void setup() {
  size(1280, 720);
  midScreen = width / 2;
  
  for (int i = 0; i < numWalkers; i++) {
    float posY = ((i + 1) * height) / (numWalkers + 1);
    float mass = 5 + i; 
    float scale = mass * 5;
    color c = color(random(255), random(255), random(255)); 
    
    walkers[i] = new Walker(50, posY, mass, scale, c); 
  }
}


void draw() {
  background(240);
  
  for (Walker w : walkers) {
    w.applyForce(accelerationForce);

    if (w.position.x > midScreen) {
      w.applyFriction(0.4);
    } else {
      w.applyFriction(frictionCoefficient);
    }

    w.update();
    w.render();
  }
}

void mousePressed() {
  setup(); 
}
