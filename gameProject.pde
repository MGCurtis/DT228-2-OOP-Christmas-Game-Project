int screen = 0;
PImage bGImg;
boolean buildable;
int lives, money;

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

int towerX, towerY;

void mouseClicked()
{
  towerX = cellX; 
  towerY = cellY;
  if(buildable)
  {
    Turret tower = new Turret(towerX, towerY);
    gameObjects.add(tower);
    towers.add(tower);
  }
}
