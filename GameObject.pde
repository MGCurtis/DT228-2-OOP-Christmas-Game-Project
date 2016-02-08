abstract class GameObject
{
  PVector pos;
  float theta = 0.0f;
  float w;
  
  
  GameObject()
  {
    this(width * 0.5f, height * 0.5f, 10);
  }
  
  GameObject(float x, float y, float w)
  {
    pos = new PVector(x, y);
    this.w = w;
    this.theta = 0.0f;
  }
}
