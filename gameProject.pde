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
  
  grid.cellSet(0,1,true);
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
  grid.cellSet(9,8,true);
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
    //println("grid.setCell(" + cellX + ")(" + cellY + ")");
  }
}

/*void intializePath(PVector[] v)
{
  path = v;
  
  for(int i = 0 ; i < v.length - 1 ; i++)
  {
    grid.cells[v[i].x][v[i].y].isPath = true;
    
    int difference = v[i].x - v[i + 1].x;
    if(difference != 0)
    {
      for(int j = 0; j < abs(difference) ; j++)
      {
        if(difference < 0); //path goes right
        //else; //path goes left
      }
    }
    else
    {
      
    }
  }
}*/
