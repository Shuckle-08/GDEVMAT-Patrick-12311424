Walker walker = new Walker();

//Walker heavyWalker = new Walker();

PVector wind = new PVector(0.05, 0);
PVector gravity = new PVector(0, -0.1); 

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  walker.mass = 2;
  walker.scale = walker.mass * 15;
}

void draw() {
  background(80);
  
  walker.render();
  walker.update();
  walker.applyForce(wind);
  walker.applyForce(gravity);
  
  //heavyWalker.render();
  //heavyWalker.update();
  //heavyWalker.applyForce(wind);
  
  if (walker.position.y <=  Window.bottom){
    walker.velocity.y *= -1;
  }
}
