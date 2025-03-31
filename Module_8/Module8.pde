ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  int numWalkers = 10;

  for (int i = 0; i < numWalkers; i++) {
    Walker w = new Walker();
    
    // Random position within screen bounds
    w.position = new PVector(random(-Window.right, Window.right), 
                             random(-Window.top, Window.top));

    // Random mass and scale
    w.mass = random(2, 6);
    w.scale = w.mass * 15;
    
    // Random colors
    w.r = random(50, 255);
    w.g = random(50, 255);
    w.b = random(50, 255);

    walkers.add(w);
  }
}

void draw() {
  background(255);

  // Apply gravitational attraction between all walkers
  for (int i = 0; i < walkers.size(); i++) {
    for (int j = 0; j < walkers.size(); j++) {
      if (i != j) {
        PVector attraction = walkers.get(j).calculateAttraction(walkers.get(i));
        walkers.get(i).applyForce(attraction);
      }
    }
  }

  // Update and render walkers
  for (Walker w : walkers) {
    w.update();
    w.render();
  }
}
