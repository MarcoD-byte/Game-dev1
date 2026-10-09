class Fish {
  // Member vairables
  int x, dx, y, dy, size, health;
  Timer tx, ty;

  //Constructor
  Fish (int x, int y, int level) {
    this.x = x;
    this.y = y;

    dy= 1;
    dx= int(random(-1, 1));
    size = 32;
    health = level;
    tx = new Timer(500);
    ty = new Timer(1000);
  }

  // Member Methods
  void display() {
    move();
    imageMode(CENTER);
    if (health == 1) {
      image(purple, x, y, 25,25);
      purple.play();
    } else if  (health > 1 && health <=3) {
      image(orange, x, y, 35,35);
      dx=0;
      orange.play();
    } else if(health>3){
     image(black, x, y, 40,40);
     black.play();
    }
  }

  void move() {
    y=y+dy;
    // bouneces off the walls when collides
    if (x <width-10 && x > 10) {
      x=x+dx;
    } else {
      dx = -dx;
      x=x+dx;
    }
    if (tx.isFinished() &&   health >3) {
      dx=int(random(-3, 3));
      tx.start();
    }
  }
  boolean outsideFrame() {
    if (y>(height+30)) {
      return true;
    } else {
      return false;
    }
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
