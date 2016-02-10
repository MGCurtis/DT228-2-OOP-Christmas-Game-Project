class Enemy extends GameObject
{
  int hitPoints;
  float speed;
  PImage[] sprites = new PImage[]{
    loadImage("jeep.png"),
    loadImage("tank.png"),
  };
  int rng;
  int radius;
  int nextWP;
  
  Enemy(PVector v, int r)
  {
    pos = v;
    forward = new PVector(0, -1);
    speed = 2.0f;
    rng = (int)random(0,10);
    radius = r;
    nextWP = 1;
    theta += HALF_PI;
  }
  
  void render(int w, int h)
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    imageMode(CENTER);
    if(rng <= 7)
    {
      image(sprites[0], 0, 0, w, h);
    }
    else
    {
      image(sprites[1], 0, 0, w, h);
    }
    noStroke();
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    pos.add(PVector.mult(forward, speed));
  }
  
  void turnLeft()
  {
    theta -= HALF_PI;
  }
  
  void turnRight()
  {
    theta += HALF_PI;
  }
  
}
