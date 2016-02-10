class Enemy extends GameObject
{
  int hitPoints; //field for enemy health
  float speed; //field for movement speed
  //array for enemy sprites
  PImage[] sprites = new PImage[]{
    loadImage("jeep.png"),
    loadImage("tank.png"),
  };

  int radius; //radius of enemy, for use in collision
  int nextWP; //integer for determining which waypoint
              //the enemy will react to next.
              //Implemented because the enemies would turn
              //multiple times at the first waypoint
  int type; //type of enemy being made
  
  //enemy constructor
  //assigns values for fields
  Enemy(PVector v, int r, int life, int type)
  {
    pos = v;
    speed = 1.0f;
    
    this.hitPoints = life;
    this.type = type;
    radius = r;
    nextWP = 1;
    theta += HALF_PI;
  }
  
  //render method
  void render(int w, int h)
  {
    //translates the origin of actions to the position of the enemy
    //and rotates the orientation to theta
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    imageMode(CENTER); //creates image around centre point
                       //instead of from the corner
    image(sprites[type], 0, 0, w, h);
    
    //create a circle around the enemy for use in collision
    //the circle is not visible
    noStroke();
    noFill();
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
  //method for updating the enemy's location
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    pos.add(PVector.mult(forward, speed));
  }
  
  //method for turning enemy to the left
  //called at appropriate waypoints
  void turnLeft()
  {
    theta -= HALF_PI;
  }
  
  //method for turning enemy to the right
  //called at appropriate waypoints
  void turnRight()
  {
    theta += HALF_PI;
  }
  
  //detect collision with bullet
  void hit()
  {
    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Bullet)
      {
        float dist = PVector.dist(go.pos, pos);
        //if bullet is within radius remove it, take 5
        //hitPoints from the enemy
        if(dist < radius)
        {
          gameObjects.remove(i);
          hitPoints -= 5;
        }
      }
    }
  }
  
  //method to remove enemies
  void die()
  {
    if(hitPoints <= 0)
    {
      enemies.remove(this); //remove enemy from array
      if(type == 0)
      {
        money += 10; 
      }
      else
      {
        money += 20;
      }
    }
  }
}
