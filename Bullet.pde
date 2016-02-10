class Bullet extends GameObject
{
  int radius;
  float speed;
  float range;
  int timer; //after timer reaches certain number bullet dies
  AudioPlayer audio; //used to play gunshot sound
  
  
  Bullet(float x, float y, int r)
  {
    pos.x = x;
    pos.y = y;
    range = r;
    radius = 4;
    speed = 2.0f;
    audio = minim.loadFile("Gunshot.wav"); //loads audio file
  }
  
  void render()
  {
    pushMatrix();
    stroke(#FF0000);
    fill(#FF0000);
    translate(pos.x, pos.y);
    rotate(theta);
    ellipse(0, 0, radius, radius);
    popMatrix();
    audio.play(); //plays audio file on bullet appearing

  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    pos.add(PVector.mult(forward, speed));
    
    timer ++;
    //after 90 frames (1.5 seconds) remove bullet.
    if(timer == 90)
    {
      gameObjects.remove(this);
    }
  }
}
