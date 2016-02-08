class Grid
{
  int rows;
  int cols;
  int cellWidth;
  int cellHeight;
  boolean[][] cells;
  
  void set(int row, int col, boolean value)
  {
    if (row >= 0 && row < rows && col >= 0 && col < cols)
    {
      cells[row][col] = value;
    }
  }
  
  void highlight(int row, int col)
  {
    stroke(200, 200, 0);
    noFill();
    rect(row * cellWidth, col * cellHeight, cellWidth, cellHeight);
  }
    
  Grid(int rows, int cols)
  {
    this.rows = rows;
    this.cols = cols;
    cells = new boolean[rows][cols];
    cellWidth = width/cols;
    cellHeight = height/rows;
  }
  
  void render()
  {
    for(int row = 0; row < rows; row ++)
    {
      for(int col = 0; col < cols; col ++)
      {
        float x = col * cellWidth;
        float y = row * cellHeight;
        
        stroke(127);
        noFill();
        rect(x, y, cellWidth, cellHeight);
      }
    }
  }
}
