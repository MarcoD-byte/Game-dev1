
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
    if ( tempX < width-25 && tempX > 0+25) {
      dx = tempX - x;
      x+=dx*easing;
    }

    if (tempY < height-25 && tempY > 25) {
      dy = tempY - y;
      y+= dy * easing;
    }
  }

}
