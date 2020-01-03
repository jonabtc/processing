//movement example: directional movement - move toward a point

//import the physics library
import fisica.*;

//declare a global variable: our newtonian world
FWorld world;

//the easies way to access objects is to declare them as global variables
FBox box;
FCircle circle;
FPoly triangle;

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

  
  //create a triangle
  triangle = new FPoly();

  //draw like a processing vertex point by point
  //the triangle is inscribed in a 100x100 square
  triangle.vertex(-50, 50);
  triangle.vertex( 50, 50);
  triangle.vertex( 0, -50);

  //the center is the position 0, 0
  triangle.setPosition(200, 300);
  
  world.add(triangle);
  
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
  
   
}


void mousePressed() {
  
  //find the angle between two points the center of the triangle and the mouse
  //to get the coordinates of a body you have to use body.getX() and body.get()
  //don't forget the ()
  float triangleX = triangle.getX();
  float triangleY = triangle.getY();
  
  float angle = getAngle(triangleX, triangleY, mouseX, mouseY);
  
  println("The angle between mouse and triangle is "+ degrees(angle) +" degrees");
  
  /*
  note: angles are a bit weird in radians and programming
  the 0 degree is on the right of the center, it goes negative counterclockwise
  and it grows going clockwise
  */
  
  //in this case if I want the top of the triangle to point toward the mouse
  //I have to add another 90 degrees (converted in radians first)
  triangle.setRotation(angle + radians(90));
  
  //if I want to apply a specific force, inpulse or set a velocity
  //at an angle I have to break it down into the horizontal and vertical components
  
  //my force, velocity, impulse, etc...
  float velocity = 1000;
  
  //the x and y components using the angle basic trigonometry
  float velocityX = velocity * cos(angle);
  float velocityY = velocity * sin(angle);
  
  //now I'm ready to add the impulse
  triangle.addImpulse(velocityX, velocityY);
  
  //try to move this whole mousePressed block in the draw loop
  //and make the triangle follow the circle instead of the mouse position
}



//this function finds the angle between two points in radians
//atan2 is magic
float getAngle(float aX, float aY, float bX, float bY)
{
return atan2(bY - aY, bX - aX);
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

