
class Diver {
  int x, y, dx, dy, health;
  float easing;

  Diver() {

    x=width/2;
    y=height/2;
    health = 5;
    easing = .1;
    dx = mouseX - x;
    dy = mouseY - Y;
  }

  void display() {
    imageMode(CENTER);
    image(diver02, x, y);
    diver02.play();
  }

  void move(int tempX, int tempY) {
    dx = tempX - x;
    if ( x+dx*easing < width-25 && x+dx*easing > 0+25) {
      x+=dx*easing;
    }
    dy = tempY - y;
    
    if (y+dy * easing < height-25 && y+dy * easing > 25) {
      dy = tempY - y;
      y+= dy * easing;
    }
  }
}
