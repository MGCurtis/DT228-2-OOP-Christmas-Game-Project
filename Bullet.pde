class Bullet extends GameObject
{
  int radius;
  
  Bullet(float x, float y, int r)
  {
    pos.x = x;
    pos.y = y;
    radius = r;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    ellipse(0, 0, radius, radius)
    popMatrix();
  }
  
  void update()
  {
    
  }
}
