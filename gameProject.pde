int screen = 0;


void setup()
{
  size(650, 650);
  PImage bGImg;
  bGImg = loadImage("gameBG.png");
  background(bGImg);
  grid = new Grid (10, 10);
  grid.render();
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
