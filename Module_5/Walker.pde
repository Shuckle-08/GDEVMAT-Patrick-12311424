public class Walker{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float mass = 1;
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker(){
  
  }
  
  public void update(){
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void applyForce(PVector force){
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void render(){    
    circle(position.x, position.y, scale);
  }
}
