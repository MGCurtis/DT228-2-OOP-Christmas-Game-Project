class Grid
{
  //ints for amount of rows and columns
  int rows;
  int cols;
  //ints for width and height of cells
  int cellWidth;
  int cellHeight;
  //boolean array storing whether the cell can be built on
  //since booleans default to false I use it as whether there
  //is something on the cell or not then reverse it when using it
  //for my buildable boolean in the main
  boolean[][] cells;
  
  //method for setting cell, takes row, column, and value
  //to set it to
  void cellSet(int row, int col, boolean value)
  {
    cells[row][col] = value;
  }
  
  //method to check the status of a cell (true or false)
  //reverses it before returning it for use in the main
  boolean cellCheck(int row, int col)
  {
    boolean status = cells[row][col];
    status = !status;
    return status;
  }
  
  //method for highlighting cells, used for highlighting the cell
  //the mouse is hovering over, takes in a colour which
  //is decided in main by whether the cell is buildable or not
  void highlight(int row, int col, color c)
  {
    stroke(c);
    noFill();
    rect(row * cellWidth, col * cellHeight, cellWidth, cellHeight);
  }
    
  //grid constructor
  Grid(int rows, int cols)
  {
    this.rows = rows;
    this.cols = cols;
    cells = new boolean[rows][cols];
    //gets cell width and height by dividing total width / height
    //by the amount of columns / rows in the grid
    cellWidth = width/cols;
    cellHeight = height/rows;
  }
  
  void render()
  {
    //renders the grid out, stopped calling this method in the
    //main because I preferred how it looked without it
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
