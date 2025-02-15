public class Walker{
  
  public float x;
  public float y;
  public float scale;
  
  public float tx = 0, ty = 100000;
  public float tScale = 69;

  void render(){
    circle(x, y, scale);
  }
  
  void perlinWalk(){
    x = map(noise(tx), 0, 1,-640, 640);
    y = map(noise(ty), 0, 1,-360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
  void perlinScale(){
    scale = map(noise(tScale), 0, 1, 5, 150);
    
    tScale += 0.01f;
  }
}
