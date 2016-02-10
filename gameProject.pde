int lives, money; //vars for lives and money

PImage bGImg; //image for level background

boolean buildable, isPath; //boolean for whether you can build on a cell

PVector[] path; //array for points on the enemy path
PVector spawnPoint; //vector location to spawn enemies

Grid grid; //constructor for grid

//Various arraylists to store assorted game objects
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Turret> towers = new ArrayList<Turret>();



void setup()
{
  size(650, 650);
  bGImg = loadImage("gameBG.png"); //load in background image

  grid = new Grid (10, 10); //initialize grid

  //initialize lives and money
  lives = 20;
  money = 150;

  //initialize path array with all points (in cell form) where an enemy
  //will turn.
  path = new PVector[] {
    new PVector(0, 1), 
    new PVector(8, 1), 
    new PVector(8, 4), 
    new PVector(0, 4), 
    new PVector(0, 8), 
    new PVector(2, 8), 
    new PVector(2, 6), 
    new PVector(4, 6), 
    new PVector(4, 8), 
    new PVector(6, 8), 
    new PVector(6, 6), 
    new PVector(8, 6), 
    new PVector(8, 8), 
    new PVector(9, 8),
  };
  
  //for loop to iterate through path array and set all cells
  //to not be buildable
  for (int i = 0; i < path.length - 1; i++)
  {
    setPath(path[i], path[i+1]);
  };
  
  //set top left cell to not be buildable, for displaying lives and money
  grid.cellSet(0,0,true);

  
}

void draw()
{
  background(bGImg); //set background
  //set text size and display lives and money in top left of screen
  textSize(15);
  text("Lives: " + lives, 0, height*0.02f);
  text("$: " + money, 0, height*0.05f);
  
  //grid.render();
  mouseCheck();
  //get centre point of spawning cell
  spawnPoint = getCellCentre(path[0]);
  
  //for loop to render all towers in the towers array
  for (int i = 0; i < towers.size (); i++)
  {
    towers.get(i).render(grid.cellWidth, grid.cellHeight);
    
    towers.get(i).shoot(towers.get(i).lookForEnemy());
    //println(towers.get(i).pos);
  }
  
  //for loop to perform actions on all enemies in the enemy array
  for (int i = 0; i < enemies.size (); i++)
  {
    enemies.get(i).render(grid.cellWidth, grid.cellHeight);
    enemies.get(i).update();
    
    //all of these are for waypoint actions, telling enemies
    //which direction to turn at what points, from the path array
    if(enemies.get(i).pos.x == getCellCentre(path[1]).x && 
    enemies.get(i).nextWP == 1)
    {
      enemies.get(i).turnRight();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.y == getCellCentre(path[2]).y && 
    enemies.get(i).nextWP == 2)
    {
      enemies.get(i).turnRight();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.x == getCellCentre(path[3]).x && 
    enemies.get(i).nextWP == 3)
    {
      enemies.get(i).turnLeft();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.y == getCellCentre(path[4]).y &&
    enemies.get(i).nextWP == 4)
    {
      enemies.get(i).turnLeft();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.x == getCellCentre(path[5]).x &&
    enemies.get(i).nextWP == 5)
    {
      enemies.get(i).turnLeft();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.y == getCellCentre(path[6]).y &&
    enemies.get(i).nextWP == 6)
    {
      enemies.get(i).turnRight();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.x == getCellCentre(path[7]).x &&
    enemies.get(i).nextWP == 7)
    {
      enemies.get(i).turnRight();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.y == getCellCentre(path[8]).y &&
    enemies.get(i).nextWP == 8)
    {
      enemies.get(i).turnLeft();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.x == getCellCentre(path[9]).x &&
    enemies.get(i).nextWP == 9)
    {
      enemies.get(i).turnLeft();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.y == getCellCentre(path[10]).y &&
    enemies.get(i).nextWP == 10)
    {
      enemies.get(i).turnRight();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.x == getCellCentre(path[11]).x &&
    enemies.get(i).nextWP == 11)
    {
      enemies.get(i).turnRight();
      enemies.get(i).nextWP ++;
    }
    
    if(enemies.get(i).pos.y == getCellCentre(path[12]).y &&
    enemies.get(i).nextWP == 12)
    {
      enemies.get(i).turnLeft();
      enemies.get(i).nextWP ++;
    }
    
    //at last waypoint enemy is removed and a life is lost
    if(enemies.get(i).pos.x == getCellCentre(path[13]).x &&
    enemies.get(i).nextWP == 13)
    {
      lives--;
      gameObjects.remove(enemies.get(i));
      enemies.remove(i);
    }
    
    //checkCollision();
  }

  //after every 90 frames, 1.5 secs, add an enemy and add it to the arrays
  if (frameCount % 90 == 0)
  {
    Enemy enemy = new Enemy(spawnPoint, 50);
    enemies.add(enemy);
    gameObjects.add(enemy);
  }
}

int cellX, cellY, pCellX, pCellY; //vars for mouse over cell and path cells

//method to check mouse location
void mouseCheck()
{
  cellX = (int)(mouseX / grid.cellWidth);
  cellY = (int)(mouseY / grid.cellHeight);
  color c;
  
  //checks to see if cell is buildable
  buildable = grid.cellCheck(cellX, cellY);
  
  //if buildable highlight in yellow, otherwise highlight in red
  if(buildable)
  {
    c = #AAAA00;
  }
  else
  {
    c = #FF0000;
  }
  grid.highlight(cellX, cellY, c);
}


void mouseClicked()
{
  //if cell is buildable and the user has 50 or more money
  //create a tower in the cell the user has their mouse over
  //add it to the gameObjects and towers arraylists
  //and subtract 50 from user's money
  if (buildable && !isPath && money >= 50)
  {
    Turret tower = new Turret(cellX, cellY);
    gameObjects.add(tower);
    towers.add(tower);
    grid.cellSet(cellX, cellY, true);
    money -= 50;
  }
}

//method to set all cells between two points to not be buildable
void setPath(PVector v1, PVector v2)
{
  int difX = int(v1.x - v2.x);
  int difY = int(v1.y - v2.y);

  //if the PVectors have different x values move along the x-axis
  //depending on if the difference is positive or negative
  //and set's all cells between them to true
  //(which in my Grid class I set up to mean there is something
  //there obstructing building)
  if (difX !=0)
  {
    if (difX < 0)
    {
      for (int i = 0; i <= abs (difX); i++)
      {
        grid.cellSet((int)v1.x + i, (int)v1.y, true); //path goes right
      }
    } else
    {
      for (int i = 0; i <= abs (difX); i++)
      {
        grid.cellSet((int)v1.x - i, (int)v1.y, true); //path goes left
      }
    }
  }
  //if there is no difference between the x values
  //do the same thing but along the y-axis
  else
  {
    if (difY < 0)
    {
      for (int i = 0; i <= abs (difY); i++)
      {
        grid.cellSet((int)v1.x, (int)v1.y + i, true); //path goes down
      }
    } else
    {
      for (int i = 0; i <= abs (difY); i++)
      {
        grid.cellSet((int)v1.x, (int)v1.y - i, true); //path goes up
      }
    }
  }
}

//method to get the centre point of a cell
//takes in vector with the array location of the cell
PVector getCellCentre (PVector v)
{ 
  int cX = ((int)v.x * grid.cellWidth) + (grid.cellWidth/2);
  int cY = ((int)v.y * grid.cellHeight) + (grid.cellHeight/2);
  PVector cellCenter = new PVector (cX, cY);
  return cellCenter;
}

//method to handle collision between enemies and bullets
void checkCollision()
{
  for (int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Enemy)
    {
      for (int j = gameObjects.size() - 1; j >= 0 ; j --)
      {
        GameObject other = gameObjects.get(j);
        
        if (other instanceof Bullet)
        {
          ((Enemy)go).hitPoints -= 5;
          gameObjects.remove(j);
          money += 5;
        }
        if(other instanceof Turret)
        {
          float distance = PVector.dist(go.pos, other.pos);
          if (distance < float(other.range/2))
          {
            
            println("Dist: " + PVector.dist(go.pos, other.pos));
          }
        }
        
      }
    }
  }
}
