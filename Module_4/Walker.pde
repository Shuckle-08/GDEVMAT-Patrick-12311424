public class Walker{
  public PVector position;
  public PVector velocity;
  public PVector acceleration;
  public float velocityLimit = 10;
  public float scale;
  
  public Walker(PVector startPos, float scaleSize){
    this.position = startPos;
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.scale = scaleSize;
  }
  
  public void update(){
    PVector mouse = new PVector(mouseX - width / 2, -(mouseY - height / 2));
    PVector direction = PVector.sub(mouse, this.position);
    direction.normalize();
    direction.mult(0.2);
    this.acceleration.set(direction);
    
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render(){    
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges(){
    if (this.position.x > Window.right){
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left){
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top){
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom){
      this.position.y = Window.top;
    }
  }
}
