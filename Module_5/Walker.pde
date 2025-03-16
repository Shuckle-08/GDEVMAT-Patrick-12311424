public class Walker {
  public PVector position;
  public PVector velocity;
  public PVector acceleration;
  public float mass;
  public float velocityLimit = 10;
  public float scale;
  public color walkerColor;
  
  public Walker(float m) {
    this.mass = m;
    this.scale = mass * 15;
    this.position = new PVector(-500, 200);
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.walkerColor = color(random(255), random(255), random(255));
  }
  
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void checkEdges() {
    if (position.x >= Window.right || position.x <= Window.left) {
      velocity.x *= -1; // Bounce off left/right
    }
    if (position.y <= Window.bottom) {
      velocity.y *= -1; // Bounce off bottom
    }
  }
  
  public void render() {
    fill(walkerColor);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
