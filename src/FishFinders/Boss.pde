class Boss {
  int health, x, y, dx, dy, size, type;
  boolean isHit, onScreen;
  //add gif
  Timer duration;

  Boss(int level, int x, int y) {
    this.x = x;
    this.y = y;
    this.type= level;
    health = 20;
    dx=1;
    dy=0;
    size = 100;
    duration = new Timer(20000);
    if (level ==1) {
      //gif = 1
    } else if (level ==2) {

      //gif = 2
    } else {
      //gif = 3
    }
  }

  void display() {
    image(orange, x, y,size,size);
    fill(255,0);
    rectMode(CORNER);
    rect(x-25,y+50, 50,10);
    fill(255,0,0,255);
    rect(x-25,y+50,(health/20)*50, 10);
    println(health);
  }
  
  void move(){
   x+=dx;
   y+=dy;
  }
  
  boolean isHit(Diver d) {
    float dist = dist(d.x, d.y, x, y);
    if (dist<size+20) {
      return true;
    } else {
      return false;
    }
  }
  
}
