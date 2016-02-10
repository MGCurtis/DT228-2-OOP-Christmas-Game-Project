class Turret extends GameObject
{
  int x, y;
  PImage towerImg= loadImage("turret1.png");
  int range;
  
  Turret(int x, int y)
  {
    this.x = x;
    this.y = y;
    range = 200;
  }
  
  void render(int w, int h)
  {
    imageMode(CORNER);
    image(towerImg, x * w, y * h, w, h);
    stroke(255,0,0);
    ellipse((x * w) + (w/2), (y * h) + (h/2), range, range);
  }
  
  GameObject enemySearch()
  {
    GameObject enemy = null;
    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Enemy)
      {

        float distance = PVector.dist(go.pos, pos);
        if (distance < range/2)
        {
          enemy = go;
        }
      }
    }
    return enemy;
  }
  
  if (enemy == null)
  {
    enemy = searchForEnemy;
  }
   /*else
    {
      PVector toEnemy = PVector.sub(pos, enemy.pos);
      float dist = PVector.dist(enemy.pos, pos);
      theta = atan2(toEnemy.y, toEnemy.x) - HALF_PI;
      forward.x = sin(theta);
      forward.y = -cos(theta);

      if (ellapsed > 30)
      {
        Projectile pro = new Projectile(pos.x, pos.y, 1, 2, 5, range,c);

        pro.pos.add(PVector.mult(forward, 15.0f));
        pro.forward = forward;
        pro.theta = theta;
        gameObjects.add(pro);
        ellapsed = 0;
      }

      if (dist < range || ((Creep)creep).life <=0)
      {
        creep = null;
      }
    }*/
}
