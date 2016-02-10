class Enemy extends GameObject
{
  int hitPoints;
  float speed;
  PImage[] sprites = new PImage[]{
    loadImage("jeep.png"),
    loadImage("tank.png"),
  };
  int rng;
  
  Enemy(int x, int y)
  {
    pos.x = x;
    pos.y = y;
    speed = 2.0f;
    rng = (int)random(0,10);
  }
  
  void render(int w, int h)
  {
    imageMode(CENTER);
    if(rng <= 7)
    {
      image(sprites[0], pos.x, pos.y, w, h);
    }
    else
    {
      image(sprites[1], pos.x, pos.y, w, h);
    }
  }
  
  void update()
  {
  }
  
  void turnLeft()
  {
  }
  
  void turnRight()
  {
  }
  
  //forward = new PVector(0, -1);
}
