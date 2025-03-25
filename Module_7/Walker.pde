public class Walker{ 
  public PVector position, velocity, acceleration;
  public float mass, scale;
  public float r, g, b;

  public Walker(float x, float y, float mass) {
    this.position = new PVector(x, y);
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.mass = mass;
    this.scale = mass * 15;
    
    this.r = random(50, 255);
    this.g = random(50, 255);
    this.b = random(50, 255);
  }
  
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }

  public void render() {
    fill(r, g, b, 255);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges(){
    if (this.position.x > Window.right){
      this.position.x = Window.right;
      this.velocity.x *= -1;
    }
    if (this.position.y <= Window.bottom){
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
  }
}
