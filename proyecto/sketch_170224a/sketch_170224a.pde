String[] start = new String[3]; 
PFont f; 
PImage mapa;
int x=100, y=400;
boolean brinco = true;

Personaje lpersonaje, rpersonaje;

void setup(){
  size(900,600);
  start[0] = "READY";
  start[1] = "FIGHT";
  start[2] = "00";
  f =  createFont("LaoUI-Bold-48", 40); 
  frameRate(30);
  mapa = loadImage("mapa1.gif");
  mapa.resize(width,height);
  
  lpersonaje  = new Personaje("L");
  rpersonaje = new Personaje("R");
  
  
}

void draw(){
  //------------------------------------------mapa------------------------------------------------------------------------------
   background(255);
  //image(mapa,0,0);
  //--------------------------------------personaje de prueba-------------------------------------------------------------------
   rpersonaje.Dibujar();
   lpersonaje.Dibujar();
  //-----------------------------------------timer--------------------------------------------------------------------------------
  translate(width/2, height/2);  
  textFont(f); 
  textAlign(CENTER); 
  text(start[2], 0 , -250);
}

void keyPressed(){
 
  fill(255,0,0); 
  
  textFont(f); 
  textAlign(CENTER); 
  text(start[0], 0 , 0); 
  
  if(keyCode == LEFT)
    rpersonaje.Actualizar(-10,0);
  if(keyCode == RIGHT)
    rpersonaje.Actualizar(10,0);
  if(keyCode == UP)    
    rpersonaje.Brincar();  
  if(keyCode == DOWN)
  
  if(key == 'a' || key == 'A')
    lpersonaje.Actualizar(-10,0);
  if(key == 'd' || key == 'D')
    lpersonaje.Actualizar(10,0);
  if(key == 'w' || key == 'W')
    lpersonaje.Brincar();
  if(key == 's' || key == 's'){}
  
  
  
  
  /**switch(keyCode)
  {
  case LEFT:
       if(x!=50)
       {x-=10;}
       break;
  case RIGHT:
       if(x!=width-50)
       {x+=10;}
       break;
  case UP:
       if(brinco)
       {y-=4;}
       if(y==300)
       {brinco = false;}
       if(!brinco)
       {y+=4;}
       if(y==400)
       {brinco = true;}
       break;
  default:
       break;
       
  }*/
}

void keyReleased(){
  fill(255,0,0); 
  
  textFont(f); 
  textAlign(CENTER); 
  text(start[1], 0 , 0);
}