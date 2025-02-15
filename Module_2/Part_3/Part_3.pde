void setup(){
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}


Walker perlinWalker = new Walker();
float r, g, b;
float tR = 420, tG = 49, tB = 8080;

void draw(){
  fill(r, g, b, 255);
  noStroke();
  
  perlinWalker.perlinWalk();
  perlinWalker.perlinScale();
  perlinColor();
  perlinWalker.render();

}

void perlinColor(){
  r = map(noise(tR), 0, 1, 0, 255);
  g = map(noise(tG), 0, 1, 0, 255); 
  b = map(noise(tB), 0, 1, 0, 255); 

  tR += 0.01f; 
  tG += 0.01f; 
  tB += 0.01f; 
}
