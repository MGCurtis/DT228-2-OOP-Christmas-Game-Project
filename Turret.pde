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
  
  void render(int cellX, int cellY, int w, int h)
  {
    image(towerImg, cellX * w, cellY * h, w, h);
    stroke(255,0,0);
    ellipse((cellX * w) + (w/2), (cellY * h) + (h/2), range, range);
  }
}
