class Bullet extends GameObject
{
  int radius;
  float speed;
  float range;
  PVector origin;
  
  Bullet(float x, float y, int r)
  {
    pos.x = x;
    pos.y = y;
    radius = r;
    range = 2*r;
    speed = 1.5f;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    pos.add(PVector.mult(forward, speed));
    
    float distance = PVector.dist(pos, origin);
    if (distance > range/2)
    {
      gameObjects.remove(this);
    }
  }
}
