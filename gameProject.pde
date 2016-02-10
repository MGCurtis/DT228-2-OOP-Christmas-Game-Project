int screen = 0;
int lives, money;

PImage bGImg;

boolean buildable, isPath;

PVector[] path;

Grid grid;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Turret> towers = new ArrayList<Turret>();

void setup()
{
  size(650, 650);
  bGImg = loadImage("gameBG2.png");
  
  grid = new Grid (10, 10);
  
  lives = 20;
  money = 150;
  
  path = new PVector[]{
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
  
  for(int i = 0 ; i < path.length - 1 ; i++)
  {
    setPath(path[i], path[i+1]);
  }
  
  /*grid.cellSet(0,1,true);
  grid.cellSet(8,1,true);
  grid.cellSet(8,4,true);
  grid.cellSet(0,4,true);
  grid.cellSet(0,8,true);
  grid.cellSet(2,8,true);
  grid.cellSet(2,6,true);
  grid.cellSet(4,6,true);
  grid.cellSet(4,8,true);
  grid.cellSet(6,8,true);
  grid.cellSet(6,6,true);
  grid.cellSet(8,6,true);
  grid.cellSet(8,8,true);
  grid.cellSet(9,8,true)*/
;

  //for(i = 0 ; i
}

void draw()
{
  background(bGImg);
  grid.render();
  mouseCheck();
  
  for(int i = 0 ; i < towers.size() ; i++)
  {
    towers.get(i).render(grid.cellWidth, grid.cellHeight);
  }
}

int cellX, cellY;

void mouseCheck()
{
  cellX = (int)(mouseX / grid.cellWidth);
  cellY = (int)(mouseY / grid.cellHeight);
  
  grid.highlight(cellX, cellY);
  buildable = grid.cellCheck(cellX, cellY);
}


void mouseClicked()
{
  if(buildable && !isPath)
  {
    Turret tower = new Turret(cellX, cellY);
    gameObjects.add(tower);
    towers.add(tower);
    grid.cellSet(cellX, cellY, true);
    println(cellX + " " + cellY);
  }
}

/*void intializePath(PVector[] v)
{
  path = v;
  
  for(int i = 0 ; i < v.length - 1 ; i++)
  {
    grid.cellSet(v[i].x, v[i].y, true);
    int difference = v[i].x - v[i + 1].x;
    if(difference != 0)
    {
      for(int j = 0; j < abs(difference) ; j++)
      {
        //if(difference < 0); //path goes right
        //else; //path goes left
      }
    }
    else
    {
      
    }
  }
}*/

void setPath(PVector v1, PVector v2)
{
  int difX = int(v1.x - v2.x);
  int difY = int(v1.y - v2.y);
  
  if(difX !=0)
  {
    if(difX < 0)
    {
      for(int i = 0 ; i <= abs(difX) ; i++)
      {
        grid.cellSet((int)v1.x + i, (int)v1.y, true); //path goes right
      }
    }
    else
    {
      for(int i = 0 ; i <= abs(difX) ; i++)
      {
        grid.cellSet((int)v1.x - i, (int)v1.y, true); //path goes left
      }
    }
  }
  else
  {
    if(difY < 0)
    {
      for(int i = 0 ; i <= abs(difY) ; i++)
      {
        grid.cellSet((int)v1.x, (int)v1.y + i, true); //path goes down
      }
    }
    else
    {
      for(int i = 0 ; i <= abs(difY) ; i++)
      {
        grid.cellSet((int)v1.x, (int)v1.y - i, true); //path goes up
      }
    }
  }
}
