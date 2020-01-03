// Definicion de vaiables globales

float g_fRadio = 200.0;
int g_iX, g_iY;
int g_iNX, g_iNY; 
int g_iDelay = 16;

void setup(){
  size(800, 600);
  frameRate(15);
  g_iX=width/2;
  g_iY=height/2;
  g_iNX=g_iX;
  g_iNY=g_iY;
}

void draw(){
  println(frameCount);
  g_fRadio += sin(frameCount/4)+random(-10,10);
// llevar el circulo al nuevo destino;

  //g_iX += (g_iNX-g_iX)/g_iDelay;
  //g_iY += (g_iNY-g_iY)/g_iDelay;
  
  g_iX=mouseX;
  g_iY= mouseY;;
  fill (0, 121, 184);
  
  stroke(255);
  
  // Dibujar un circulo
  
  ellipse(g_iX, g_iY, g_fRadio, g_fRadio);
  
}

void mouseMoved(){
  g_iNX=mouseX;
  g_iNY= mouseY;;
}