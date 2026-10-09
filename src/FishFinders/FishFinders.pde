// Marco DalCanto | 17 Sept 2026 | Fish Finders

import processing.sound.*;
// diver w/fish
SoundFile impact1;
SoundFile caught1;
SoundFile crack;

import gifAnimation.*;


Gif diver02;
Gif orange;
Gif purple;
Gif black;
Gif net;



Diver d1;
Timer tf, tp, tl;



int ammo, maxAmmo, score, fishPassed, level;
color background;
boolean play;

PImage ocean;

ArrayList<Fish> fishes = new ArrayList<Fish>();
ArrayList<PowerUp> powUps = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Boss boss1;

void setup() {
  level=1;
  ammo=3;
  maxAmmo = 5;
  score = 0;
  fishPassed=0;
  play = false;
  // background
  size(700, 700);
  background = color(level*.5*100, level*.5*160, level*.5*200);
  background(background);
  //diver
  d1 = new Diver();
  boss1 = new Boss(level, -50, 100);
  // establish distribution timers
  tf = new Timer(3000);
  tl = new Timer(300);
  tp = new Timer(int(random(5000, 50000)));
  tp.start();
  tf.start();
  // establish gifs of fish, diver
  diver02 = new Gif(this, "diver02.gif");
  orange = new Gif(this, "orangeFish.gif");
  black = new Gif(this, "blackFish.gif");
  purple = new Gif(this, "purpleFish.gif");
  net = new Gif(this, "net.gif");
  impact1 = new SoundFile(this, "impactSound.mp3");
  caught1 = new SoundFile(this, "fishSplash.mp3");
  crack = new SoundFile(this, "crack.mp3");

  ocean = loadImage("ocean.jpg");
}

void draw() {
  if (!play) {
    tutorialScreen();

    //startScreen();
  } else {
    background(background);
    scoreBoard();
    // diver
    d1.move(mouseX, mouseY);
    d1.display();
    if (score>50){
      if(boss1.health>0){
      boss1.display();
      boss1.move();
      }
    }
    // enemies
    if (tf.isFinished()) {
      fishes.add(new Fish(int(random(50, width-50)), 10, int(random(1, 6))));
      tf.start();
    }
    if (tp.isFinished()) {
      powUps.add(new PowerUp(int(random(10, width-10)), 10));
      tp.start();
    }


    // Fish --> mode/display/remove
    for (int i =0; i< fishes.size(); i++) {
      Fish f = fishes.get(i);
      f.display();
      f.move();
      if (f.isHit(d1)) {
        fishes.remove(f);
        d1.health--;
        impact1.play();
        //animate damage
      }
      if (f.outsideFrame()) {
        fishes.remove(f);
        fishPassed++;
      }
    }

    // Net/Laser --> move/display/remove
    for (int i =0; i< lasers.size(); i++) {
      Laser l = lasers.get(i);
      l.display();
      l.move();

      if (l.outsideFrame()||l.size<1||l.size>65) {
        lasers.remove(l);
      }
      for (int j =0; j< fishes.size(); j++) {
        Fish f = fishes.get(j);
        if (l.isHit(f.x, f.y)) {
          l.dy=0;
          score+=5;
          f.health --;
          if (f.health<1) {
            fishes.remove(f);
            l.state = 1;
            caught1.play();
          } else {
            l.state=2;
            crack.play();
          }
        }
      }
      if (l.state == 2) {
        l.size -= .3;
      }
      if (l.state ==1) {
        l.size += 1;
      }
      if (l.isHit(boss1.x, boss1.y)){
        boss1.health-=1;
      }
    }
    println(lasers.size());

    if (tl.isFinished() && ammo< maxAmmo) {
      ammo++;
      tl.start();
    }

    // Power ups --> move/display/remove
    for (int i = 0; i< powUps.size(); i++) {
      PowerUp p = powUps.get(i);
      p.display();
      p.move();
      if (p.isHit(d1)) {
        p.poweringUp();
        powUps.remove(p);
      }
      if (p.outsideFrame()) {
        powUps.remove(p);
      }
    }

    if (d1.health<1 || fishPassed > 5) {
      gameOver();
    }
  }
}


void keyPressed() {
  if (key == ' '&& ammo>=1 && play) {
    lasers.add(new Laser(d1.x, d1.y));
    ammo -= 1;
    tl.start();
  }
  if (key == ' '&& !play) {
    play = true;
    loop();
    tp.start();
    tf.start();
  }
}

void scoreBoard() {
  rectMode(CENTER);
  textMode(LEFT);
  textAlign(CENTER);
  fill(#33C5D1, 75);
  rect(width/2, 20, width, 40);
  textSize(30);
  fill(200);
  text("Your Score: " + score, 100, 30);
  text("Ammo: " + ammo, 420, 30);
  text("Health: " + d1.health, 275, 30);
  text("Fish passed: " + fishPassed, 575, 30);
}

void tutorialScreen() {
  imageMode(CENTER);
  textAlign(CENTER);
  noLoop();
  background(background);
  image(diver02, width/6, height/2);
  text("This ^ is you", width/6, height/2+75);
  text("the diver will follow your mouse", width/6, height/2 + 90);
  image(net, width/2, height-50);
  text("Don't let fish              reach the bottom", 5*width/6, height/2);
  image(orange, 5*width/6-10, height/2-50);
  image(purple, 5*width/6-10, height/2);
  image(black, 5*width/6-10, height/2+50);
  fill(255);
  textSize(50);
  text("Press space to start...", width/2, 100);
  fill(200);
  textSize(20);
  text("During game, click space to fire nets", width/2, 600);
}

void startScreen() {
  imageMode(CENTER);
  textAlign(CENTER);
  noLoop();
  background(background);
  image(ocean, width/2, height/2);

  image(diver02, width/8, height-75);
  image(net, 7*width/8, height-75);

  fill(255);
  textSize(50);
  text("Press space to start...", width/2, 100);
  fill(200);
  textSize(20);
  text("During game, click space to fire nets", width/2, 600);
}

void gameOver() {
  play = false;
  noLoop();
  startScreen();
  fill(200);
  textSize(20);
  textMode(CENTER);
  text("Game Over", width/2, height/2);
  scoreBoard();
  ammo=3;
  maxAmmo = 5;
  score = 0;
  fishPassed=0;
  d1.health=5;

  fishes.clear();
  lasers.clear();
}
