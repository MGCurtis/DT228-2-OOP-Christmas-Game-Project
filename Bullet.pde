class Bullet extends GameObject
{
  int radius;
  float speed;
  float range;
  int timer;
  
  Bullet(float x, float y, int r)
  {
    pos.x = x;
    pos.y = y;
    range = r;
    radius = 4;
    speed = 2.0f;
  }
  
  void render()
  {
    pushMatrix();
    stroke(#FF0000);
    fill(#FF0000);
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
    
    timer ++;
    if(timer == 90)
    {
      gameObjects.remove(this);
    }
  }
}
