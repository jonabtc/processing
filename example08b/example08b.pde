//movement example: 4 directions

//import the physics library
import fisica.*;

//declare a global variable: our newtonian world
FWorld world;

//the easies way to access objects is to declare them as global variables
FBox box;
FCircle circle;

int BOX_SPEED = 100;

//this is for the keyboard state detection - leave it here
boolean[] keys = new boolean[526];


void setup() {
  //sketch size
  size(800, 600);

  //initialize the library
  Fisica.init(this);

  //create a new Fisica world
  world = new FWorld();

  //creates the edges: 4 static bodies at the edge of the sketch
  world.setEdges();

  //their names are world.left, world.right, world.bottom, world.top 
  //set borders invisible (but still active)
  world.top.setDrawable(false);
  world.right.setDrawable(false);
  world.bottom.setDrawable(false);
  world.left.setDrawable(false);
  
  //for this example we are disabling the grab
  world.setGrabbable(false);
  
  //no gravity
  world.setGravity(0, 0);

  
  //create a box
  box = new FBox(50, 50);
  //appearance
  box.setNoStroke();
  box.setFill(255);
  //inertia
  box.setDamping(10);
  //no rotation
  box.setRotatable(false);
  //set its position in the center of the sketch to the left
  box.setPosition(200, 300);
  world.add(box);
  
  
  //create a circle
  circle = new FCircle(20);
  //appearance
  circle.setNoStroke();
  circle.setFill(255);
  //no inertia
  circle.setDamping(0);
  //make it lighter
  circle.setDensity(0.1);
  //make it bouncier
  circle.setRestitution(1);
  //no rotation
  circle.setRotatable(false);
  //set its position in the center of the sketch to the left
  circle.setPosition(400, 300);
  world.add(circle);
}


void draw() {
  
  //simulating and drawing are separate steps
  //update the simulation
  world.step();

  background(0);
  
  //draw the physics world
  world.draw();
  
  //box movements
  //i use adjust instead of set because I want to control the x velocity and y velocity independently
  
  if(keyIsDown(RIGHT)) {
  box.adjustVelocity(BOX_SPEED, 0);
  }
  
  if(keyIsDown(LEFT)) {
  box.adjustVelocity(-BOX_SPEED, 0);
  }
  
  if(keyIsDown(DOWN)) {
  box.adjustVelocity(0, BOX_SPEED);
  }
  
  if(keyIsDown(UP)) {
  box.adjustVelocity(0, -BOX_SPEED);
  }
  
  //adding forces may make object go way too fast
  //this function (see below) sets a maximum velocity on box x and y
  //usage: limitVelocity(your body, maximum horizontal speed, maximum vertical speed);
  
  limitVelocity(circle, 400, 400);
  
   
}


//this is the implementation of the limit function 
//this is not part of fisica! You have to copy this code in your sketch
void limitVelocity(FBody b, float mX, float mY)
{
   if(b.getVelocityX() > mX)
    b.setVelocity(mX, b.getVelocityY());
   
   if(b.getVelocityX() < -mX)
    b.setVelocity(-mX, b.getVelocityY());
   
   if(b.getVelocityY() > mY)
    b.setVelocity(b.getVelocityX(), mY);
   
   if(b.getVelocityY() < -mY)
    b.setVelocity(b.getVelocityX(), -mY);
}



//this function is called when a key is pressed
void keyPressed() {
  //this is for the keyboard state detection - leave it here
  keys[keyCode] = true;
  
}


//this function is called when a key is released
void keyReleased() {
  //this is for the keyboard state detection - leave it here
  keys[keyCode] = false; 
}



//this is for the keyboard state detection - leave it here
boolean keyIsDown(char c) { String s = c + "";
return keyIsDown(int(s.toUpperCase().charAt(0))); }
boolean keyIsDown(String s) { return keyIsDown(int(s.toUpperCase().charAt(0))); }
boolean keyIsDown(int code) { if (keys.length >= code) { return keys[code]; } return false; }

