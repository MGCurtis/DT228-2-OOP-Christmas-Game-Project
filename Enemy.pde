class Enemy extends GameObject
{
  int hitPoints; //field for enemy health
  float speed; //field for movement speed
  //array for enemy sprites
  PImage[] sprites = new PImage[]{
    loadImage("jeep.png"),
    loadImage("tank.png"),
  };
  int rng; //random number integer for spawning different
           //enemies randomly
  int radius; //radius of enemy, for use in collision
  int nextWP; //integer for determining which waypoint
              //the enemy will react to next.
              //Implemented because the enemies would turn
              //multiple times at the first waypoint
  
  //enemy constructor
  //assigns values for fields
  Enemy(PVector v, int r)
  {
    pos = v;
    speed = 1.0f;
    rng = (int)random(0,10); //picks a random number between
                             //0 and 10 at construction
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
    //if rng is 7 or below create a jeep and have 10 hitPoints
    if(rng <= 7)
    {
      image(sprites[0], 0, 0, w, h);
      hitPoints = 10;
    }
    //otherwise create a tank and have 20 hitPoints
    else
    {
      image(sprites[1], 0, 0, w, h);
      hitPoints = 20;
    }
    //create a circle around the enemy for use in collision
    //the circle is not visible
    noStroke();
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
  
  void hit()
  {
    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Bullet)
      {
        float dist = PVector.dist(go.pos, pos);
        //if(dist < 
      }
    }
  }
}
