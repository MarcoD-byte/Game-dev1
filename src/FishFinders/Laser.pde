class Laser {

  int x, y, dy, dx, h, w, state;
  float size;

  Laser(int x, int y) {
    this.x = x;
    this. y = y;
    dy = 20;
    dx=0;
    w= 8;
    h=40;
    state=0;
    size = 45;

  }

  void display() {
      net.jump(state);
      image(net, x, y, size, size);
    
  }



  void move() {
    y-=dy;
    x+=dx;
  }

  boolean outsideFrame() {
    if (y<-20||y>height+20) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(int q, int w) {
    float d = dist(x, y,q, w);
    if (d<15&& state == 0) {
      return true;
    } else {
      return false;
    }
  }
}
