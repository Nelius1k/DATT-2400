float global1;
PVector vel;
PVector pos;

void setup() {
 
  size(600,600);
  
  
  //function used to center the rectangle
  rectMode(CENTER);
  //frameRate(2);
  background(255);
  
}

void draw() {

  background(0);
  noFill();
  vel = new PVector(sin(89), random(height));
  pos = new PVector(random(width), random(height));
  
  
  
  
  for (int j=0; j < 15; j++) {
   
    pyramid(random(100, 500),random(200),random(2));
    
  }
  
  
  // this function makes our code only run once
  noLoop();
  
  //saveFrame("Light_##.png");

}

void mousePressed() {
  redraw();
}

void pyramid(float size, float limit, float diff) {

  float red = random(255);
  float green = random(255);
  float blue = random(255); 
  
  for(int i=0; i < limit; i++) {
    for (int j=0; j <limit/2; j++) {
    
     
    size-=diff;
    
    red -= 0.1;
    green -= 0.7;
    blue -= 0.2;
    
    stroke(red,green,blue);
    
    /*
    Values x and y can be replaced by mouseX and mouseY for better user experience
    */
    ellipse(mouseX,mouseY,size,size);
    rect(mouseX,mouseY, size/3, size/3);
    
    }
    
    
    translate(10,25);
  }

}
