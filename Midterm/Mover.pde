class Mover {
  PVector position, velocity, target;
  float size;
  float r, g, b;
  float speed = 5;

  Mover(PVector blackHole, float blackHoleSize) {
    float meanX = 0;
    float meanY = 0;
    float stddev = 200;

    position = new PVector(meanX + randomGaussian() * stddev, meanY + randomGaussian() * stddev);
    target = blackHole.copy();

    velocity = PVector.sub(target, position);
    velocity.setMag(speed);

    size = min(abs(randomGaussian() * 10) + 5, blackHoleSize);

    r = random(100, 255);
    g = random(100, 255);
    b = random(100, 255);
  }

  void moveToBlackHole() {
    if (!hasReachedBlackHole()) {
      PVector nextPosition = PVector.add(position, velocity);
      if (PVector.dist(nextPosition, target) < speed) {
        position.set(target);
      } else {
        position.add(velocity);
      }
    }
  }

  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(position.x, position.y, size, size);
  }

  boolean hasReachedBlackHole() {
    return position.equals(target);
  }
}
