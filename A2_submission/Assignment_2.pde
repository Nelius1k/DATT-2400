Rectangle[] rect;
Circle[] cir;
float rsize = 150;
float angle;
int num = 360;
PVector posRect;
PVector posCir;

void setup() {
 
  size(600,600);
  rect = new Rectangle[num];
  cir = new Circle[num];
  
  /*
  for(int i=0; i<num; i++) {
    
  }
  */
}

void draw() {
 
  background(0);
  
  translate(width/2,height/2);
  
  /*
  for(float i=0; i<360; i+=10) { // loop used the draw more rectangles
    
    pushMatrix();
     //since we're in a loop, the canvas is being translated num amount of times
    rotate(radians(i));
    //rotate(radians((width/2)*sin(radians(angle))));
    noFill();
    stroke(random(255), random(255), 150);
    //rect((width/4)*cos(radians(angle)), 0,100,100);
    rect(0, 0,100,100);
    //rect(0, 0, rsize-(i*10), rsize+(i*10));
    //fill(255);
    fill(random(255), 10, random(255));
    ellipse((width/3)*sin(radians(angle)), 0,25,25);
    popMatrix();
  }
  */
  
  for(int i=0; i<num; i+=10) {
    //rect[i] = new Rectangle(pos,100,100);
    posRect = new PVector((width/4)*cos(radians(angle)),0);
    posCir = new PVector((width/3)*cos(radians(angle)),0);
    rect[i] = new Rectangle(posRect,100,100);
    cir[i] = new Circle(posCir,20,20);
    pushMatrix();
    rotate(radians(i));
    rect[i].drawRect();
    cir[i].drawCir();
    popMatrix();
  }
  
  angle++;
  
}

class Rectangle {
  
  PVector pos;
  float w;
  float h;
  //float angle;
  float opacity = random(255);
  
  Rectangle(PVector p, float wi, float he) {
    
    this.pos = p;
    this.w = wi;
    this.h = he;
    //this.angle = a;
    
  }
  
  void drawRect() {
    
    //noStroke();
    noFill();
    stroke(random(255), random(255), 150);
    //fill(255, opacity);
    rect(pos.x,pos.y,w,h);
    
  }
  
  
  
  
}

class Circle {
  
  PVector pos;
  float w;
  float h;
  //float angle;
  
  Circle(PVector p, float wi, float he) {
    
    this.pos = p;
    this.w = wi;
    this.h = he;
    //this.angle = a;
    
  }
  
  void drawCir() {
    
    fill(random(255), 10, random(255));
    ellipse(pos.x,pos.y,w,h);
    
  }
  
}
