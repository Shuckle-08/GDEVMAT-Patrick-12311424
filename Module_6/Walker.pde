public class Walker {
  public PVector position;
  public PVector velocity;
  public PVector acceleration;
  public float mass;
  public float scale;
  public color walkerColor;

  Walker(float x, float y, float m, float s, color c) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
    scale = s;
    walkerColor = c;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void render() {
    fill(walkerColor);
    noStroke();
    ellipse(position.x, position.y,scale, scale);
  }

  void applyFriction(float mew) {
    if (velocity.mag() > 0) {
      float normal = 1;
      float frictionMagnitude = mew * normal;
      PVector friction = velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMagnitude);
      applyForce(friction);
    }
  }
}
