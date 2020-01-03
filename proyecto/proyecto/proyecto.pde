// Need G4P library
import g4p_controls.*;
PImage fondoPrincipal;

public void setup(){
  size(900,600, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  fondoPrincipal = loadImage("recursos/imagenes/mainBackground.jpg");
  fondoPrincipal.resize(width, height);
  
}

public void draw(){
 // PImage 
// background();  
  background(fondoPrincipal);
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}