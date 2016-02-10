class Turret extends GameObject
{
  int x, y;
  PImage towerImg= loadImage("turret1.png");
  float range;
  
  Turret(int x, int y)
  {
    this.x = x;
    this.y = y;
    range = 200;
  }
  
  void render(int w, int h)
  {
    image(towerImg, x * w, y * h, w, h);
    stroke(255,0,0);
    ellipse((x * w) + (w/2), (y * h) + (h/2), range, range);
  }
}
