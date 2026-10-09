class PowerUp {
  // Member vairables
  int x, dx, y, dy; 
  char type;
  PImage powNet, powBoots, medKit;

  //Constructor
  PowerUp (int x, int y) {
    this.x = x;
    this.y = y;
    dx= int(random(-1, 1));
    dy= int(random(1, 3));
    if(random(2)<1){
     type =1; 
    } else if(random(2)<1){
     type =2;
    }else {
     type =3; 
    }
    println(type);
    powNet = loadImage("powNet.png");
    powBoots = loadImage("powBoots.png");
    medKit = loadImage("medKit.png");
    //red = loadImage("redFish");
  }
  
  // Member Methods
  void display() {
    move();
    imageMode(CENTER);
    if (type==1) {
      image(powNet, x, y);
    } else if (type==2) {
      image(powBoots, x, y);
    }else {
      image(medKit, x, y);  
    }
  }

  void move() {
    y=y+dy;
    x=x+dx;
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
    if (dist<50) {
      return true;
    } else {
      return false;
    }
  }
  void poweringUp() {
    if (type ==1) {
      maxAmmo ++;
    } else if (type==2) {
      d1.easing=((1-d1.easing)/(2));
    }else{
     d1.health = 5; 
    }
  }
}
