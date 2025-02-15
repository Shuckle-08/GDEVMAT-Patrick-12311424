class Walker{
  float x;
  float y;
  
  void render(){    
    circle(x,y,30);
  }
  
  void randomWalk(){
    int rng = int(random(7));
  
    if (rng == 0){
      y+=10; //up
    }
    else if (rng == 1){
      y-=10; //down
    }
    else if (rng == 2){
      x+=10; //right
    }
    else if (rng == 3){
      x-=10; //left
    }
    else if (rng == 4){
      y+=10;
      x-=10; //upper left
    }
    else if (rng == 5){
      y+=10;
      x+=10; //upper right
    }
    else if (rng == 6){
      y-=10;
      x-=10; //lower left
    }
    else if (rng == 7){
      y-=10;
      x+=10; //lower right
    }
  }
  
  void randomWalkBiased(){ //2 chances of going up
    int rng = int(random(4));
    
    if (rng == 0){
      y+=10; //up
    }
    else if (rng == 1){
      y-=10; //down
    }
    else if (rng == 2){
      x+=10; //right
    }
    else if (rng == 3){
      x-=10; //left
    }
    else if (rng == 4){
      y+=10; //up
    }
  }
}
