void setup(){
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos(){
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x , y);
}

void draw() {
    background(130);
    strokeWeight(5);
    stroke(255, 0, 0);

    PVector mouse = mousePos();

    // Handle
    PVector handleStart = new PVector(0, 0);
    PVector handleEnd = mouse.copy().normalize().mult(50);

    strokeWeight(15);
    stroke(0, 0, 0);
    line(handleStart.x, handleStart.y, handleEnd.x, handleEnd.y);
    line(handleStart.x, handleStart.y, -handleEnd.x, -handleEnd.y);

    // RedGlow
    PVector redGlowStart = handleEnd.copy();
    PVector redGlowEnd = mouse.copy().normalize().mult(300);

    strokeWeight(20);
    stroke(255, 0, 0);
    line(redGlowStart.x, redGlowStart.y, redGlowEnd.x, redGlowEnd.y);
    line(-redGlowStart.x, -redGlowStart.y, -redGlowEnd.x, -redGlowEnd.y);

    // WhiteGlow
    PVector whiteGlowStart = handleEnd.copy();
    PVector whiteGlowEnd = mouse.copy().normalize().mult(290);

    strokeWeight(10);
    stroke(255, 255, 255);
    line(whiteGlowStart.x, whiteGlowStart.y, whiteGlowEnd.x, whiteGlowEnd.y);
    line(-whiteGlowStart.x, -whiteGlowStart.y, -whiteGlowEnd.x, -whiteGlowEnd.y);
}
