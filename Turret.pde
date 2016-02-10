class Turret extends GameObject
{
  int x, y;
  PImage towerImg= loadImage("turret1.png");
  int delay;
  
  Turret(int x, int y)
  {
    this.x = x;
    this.y = y;
    range = 200;
  }
  
  void render(int w, int h)
  {
    //sets image mode back to corner so that it doesn't
    //create tower images from the centre like I was using
    //for the enemy sprites
    imageMode(CORNER);
    image(towerImg, x * w, y * h, w, h);
    super.pos = new PVector((x * w) + (w/2), (y * h) + (h/2));
    stroke(255,0,0);
    //ellipse for reference of range of towers
    ellipse((x * w) + (w/2), (y * h) + (h/2), range, range);
  }
  
  //method to find enemies that are in range of turret
  GameObject lookForEnemy()
  {
    GameObject enemy = null; //stays null if no enemies in range
    //goes through gameObjects array, looks at all enemies
    //finds distance between each enemy and turret
    //if distance is less than the turret's range the enemy
    //is stored in the 'enemy' variable declared above
    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Enemy)
      {
        float distance = PVector.dist(go.pos, pos);
        if (distance < range/2)
        {
          enemy = go;
          //println(distance);
        }
      }
    }
    return enemy;
  }
  
  //method to shoot bullets, takes in enemy found in above method
  void shoot(GameObject enemy)
  {
    if (enemy == null)
    {
      enemy = lookForEnemy();
    }
    else
    {
      PVector toEnemy = PVector.sub(pos, enemy.pos);
      float dist = PVector.dist(enemy.pos, pos);
      theta = atan2(toEnemy.y, toEnemy.x) - HALF_PI;
      forward.x = sin(theta);
      forward.y = -cos(theta);
      delay ++;
      if (delay > 30)
      {
        Bullet bullet = new Bullet(pos.x, pos.y, range);
        bullet.pos.add(PVector.mult(forward, 15.0f));
        bullet.forward = forward;
        bullet.theta = theta;
        gameObjects.add(bullet);
        delay = 0;
        println("Shoot");
      }
      if (dist < range || ((Enemy)enemy).hitPoints <=0)
      {
        enemy = null;
      }
    }
  }
}
