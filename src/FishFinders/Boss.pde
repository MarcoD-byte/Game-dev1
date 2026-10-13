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
      dx =1;
    } else if (level ==2) {
      dx= -1;
      //gif = 2
    } else {
      //gif = 3
    }
  }

  void display() {
    if (level == 1){
    image(orange, x, y, size, size);
    }else {
     image(black, x, y, size, size); 
    }
    fill(255, 0);
    rectMode(CORNER);
    rect(x-25, y+70, 50, 7);
    fill(255, 0, 0, 255);
    rect(x-25, y+70, (health*(50/20)), 7);
    //println(health);
  }

  void move() {
    x+=dx;
    y+=dy;
    if (x>width) {
      gameOver();
    }
  }

  boolean isHit(Diver d) {
    float dist = dist(d.x, d.y, x, y);
    if (dist<size*2) {
      return true;
    } else {
      return false;
    }
  }
}
