import processing.sound.*;

SoundFile music;
Bubble inst;
Timer countdown;
PFont font;
PImage img;
PVector pos;

int score;
int num = 200;
int timeLeft = 30;
String gameScreen;

void setup() {
   size(600,650); 
   
   music = new SoundFile(this, "data/Für_Elise.mp3");
   
   score = 0;
   countdown = new Timer(1000);
   
   font = loadFont("Impact-48.vlw");
   
   pos = new PVector(random(50, (width-50)), random(50, (height-50)));
   inst = new Bubble(pos, 50);
   
   gameScreen = "START";
  
}

void draw() {
  background(0);
  //ellipse(width/2, height/2, 100,100);
  
  if (gameScreen == "START") {
    initScreen();
  } 
  else if (gameScreen == "PLAY") {
    background(#bbd0ff);
    
    playScreen();
  } 
  else if (gameScreen == "END") {
    background(0);
    
    endScreen();
  } 
  
  
  
}

//Initial screen when program run
void initScreen() {
  textFont(font,30);
  textAlign(CENTER);
  fill(255,0,0);
  text("CLICK IT!!", width/2, height/2-60);
  textSize(22);
  fill(0,0,255);
  text("Rule: click on circle to score", width/2, height/2); 
  
  fill(200);
  ellipse(width/2, height/2+150, 100, 100);
  fill(0,120,0);
  text("CLICK\nTO\nPLAY", width/2, height/2+140);
  
  float d = dist(mouseX, mouseY, width/2, height/2+150);
  if(mousePressed && (d < 50)) {
    music.play();
    gameScreen = "PLAY";
    countdown.startTimer();
  }
}

//Screen when game starts
void playScreen() {
  
  inst.drawCir();
  
  if(countdown.complete() == true) {
    if(timeLeft > 1) {
      timeLeft--; 
      countdown.startTimer();
    }
    else {
      music.stop();
      gameScreen = "END";
      resetGame();
    }
  }
  String t = "Time left: " + timeLeft;
  textAlign(LEFT);
  textSize(20);
  fill(255,0,0);
  text(t, 20, 30);
  
  String s = "Score: " + score;
  textAlign(RIGHT);
  textSize(20);
  fill(255,0,0);
  text(s, width-45, 30);
}

void endScreen() {
  String s = "Your score: " + score;
  textAlign(CENTER);
  textSize(30);
  fill(255,0,0);
  text("GAME OVER", width/2, height/2-50);
  fill(0,0,250);
  text(s, width/2, height/2);
  //textSize(24);
  //fill(0,0,250);
  //text("You can do better than that!\nPlay again?", width/2, height/2);
  
  //rect(width/2-40, (height/2+60), 100, 60);
  
  fill(200);
  ellipse(width/2-120, height/2+120, 100, 100);
  fill(0,120,0);
  text("PLAY\nAGAIN", width/2-120, height/2+115);
  float d = dist(mouseX, mouseY, width/2-120, height/2+120);
  
  fill(200);
  ellipse(width/2+120, height/2+120, 100, 100);
  fill(0,120,0);
  text("HOME", width/2+120, height/2+130);
  float d2 = dist(mouseX, mouseY, width/2+120, height/2+120);
  
  if(mousePressed && (d < 50)) {
    music.play();
    gameScreen = "PLAY";
    score = 0;
  }
  else if(mousePressed && (d2 < 50)) {
    gameScreen = "START";
  }
}

//resets the timer once game is over
void resetGame() {
  timeLeft = 31;  
}
void mousePressed() {
  
    inst.mouseIsHovered(mouseX, mouseY);
    
}

class Bubble {
  PVector pos;
  float diameter;
  float xspeed;
  
  
  Bubble(PVector p, float d) {
    
    pos = p;
    this.diameter = d;
    
  }
  
  void drawCir() {
    
      
      fill(0);
      ellipse(this.pos.x,this.pos.y,diameter,diameter);
    
    
  }
  
  void mouseIsHovered(float mX, float mY) {
    float d = dist(mX, mY, this.pos.x, this.pos.y);
    //boolean music = false;
    
    
    if(d < (this.diameter/2)) {
      this.pos.x = random(50, (width-50));
      this.pos.y = random(50, (height-50));
      score++;
      
    }
    
  }
  
  
}

class Timer {
  int start;
  int interval;
  
  Timer(int t) {
    interval = t;
  }
  
  void startTimer() {
    start = millis();
  }
  
  boolean complete() {
   
    int timeElapsed = millis() - start;
    
    if(timeElapsed > interval) {
      return true; 
    }
    else {
      return false; 
    }
  }
}
