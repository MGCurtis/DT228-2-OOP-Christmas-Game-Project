int screen = 0;
PImage bGImg, jeepImg, tankImg;

void setup()
{
  size(650, 650);
  bGImg = loadImage("gameBG2.png");
  
  grid = new Grid (10, 10);

  /*for(int i = 1; i < 10; i++)
  {
    int hGap = width / 10;
    int vGap = height / 10;
    stroke(127);
    line(hGap*i, height, hGap*i, 0);
    line(width, vGap*i, 0, vGap*i);
  }*/
}

Grid grid;

void draw()
{
  background(bGImg);
  grid.render();
  mouseCheck();
}

void mouseCheck()
{
  int x = (int)(mouseX / grid.cellWidth);
  int y = (int)(mouseY / grid.cellHeight);
  grid.highlight(x, y);
}
