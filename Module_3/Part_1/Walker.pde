class Walker{
  PVector position = new PVector();
  PVector direction = new PVector();
  PVector speed = new PVector(5, 8);
  
  void render(){    
    circle(position.x,position.y, 30);
  }
  
  void randomWalk(){
    int rng = int(random(7));
  
  if (rng == 0) {
      direction.set(0, 10); // Up
  } 
  else if (rng == 1) {
      direction.set(0, -10); // Down
  } 
  else if (rng == 2) {
      direction.set(10, 0); // Right
  } 
  else if (rng == 3) {
      direction.set(-10, 0); // Left
  } 
  else if (rng == 4) {
      direction.set(-10, 10); // Upper left
  } 
  else if (rng == 5) {
      direction.set(10, 10); // Upper right
  } 
  else if (rng == 6) {
      direction.set(-10, -10); // Lower left
  } 
  else if (rng == 7) {
      direction.set(10, -10); // Lower right
  }

  position.add(direction);
  }
  
  void randomWalkBiased(){ //2 chances of going up
    int rng = int(random(4));
    
    if (rng == 0){
      direction.set(0, 10); // Up
    }
    else if (rng == 1){
      direction.set(0, -10); // Down
    }
    else if (rng == 2){
      direction.set(10, 0); // Right
    }
    else if (rng == 3){
      direction.set(-10, 0); // Left
    }
    else if (rng == 4){
      direction.set(0, 10); // Up
    }
  }
  
  void moveAndBounce(){
    position.add(speed);
    
    if ((position.x > Window.right) || (position.x < Window.left)){
      speed.x *= -1;
    }
    if ((position.y > Window.top) || (position.y < Window.bottom)){
      speed.y *= -1;
    }
  }
}
