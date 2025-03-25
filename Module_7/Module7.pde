Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  float spacing = Window.right * 2 / walkers.length;
  for (int i = 0; i < walkers.length; i++) {
    float x = Window.left + spacing * i + spacing / 2;
    float mass = random(1, 5);
    walkers[i] = new Walker(x, Window.top + 50, mass);
  }
}

void draw() {
  background(255);
  
  ocean.render();
  
  for (Walker w : walkers) {
    w.update();
    w.render();
    w.checkEdges();
    
    // Forces
    PVector gravity = new PVector(0, -0.15 * w.mass);
    PVector wind = new PVector(0.1, 0);
    
    w.applyForce(gravity);
    w.applyForce(wind);
    
    // Liquid drag
    if (ocean.isCollidingWith(w)) {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  } 
}
