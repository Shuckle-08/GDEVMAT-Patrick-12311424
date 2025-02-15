int r,g,b,a;

void setup(){
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();
Walker biasedWalker = new Walker();

void draw(){
  myWalker.randomWalk();
  biasedWalker.randomWalkBiased();

  randomizeColor();
  fill(r,g,b,a);
  
  myWalker.render();
  
  randomizeColor();
  fill(r,g,b,a);
  
  biasedWalker.render();
}

void randomizeColor(){
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(50, 100));
}
