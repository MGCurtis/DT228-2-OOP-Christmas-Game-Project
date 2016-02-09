class Turret extends GameObject
{
  int cellX, cellY;
  PImage towerImg;
  float range;
  
  Turret(int x, int y)
  {
    cellX = x;
    cellY = y;
    towerImg = loadImage("turret1.png");
    range = 100;
  }
  
  void render(int cellX, int cellY)
  {
    image(towerImg, cellX, cellY);
  }
}
