void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();

void draw(){
  //Flush
  background(255);
  
  //Actions
  myWalker.randomWalk();
  myWalker.randomWalkBiased();
  myWalker.moveAndBounce();
  
  //Render
  fill (182, 52, 100);
  myWalker.render();
}
