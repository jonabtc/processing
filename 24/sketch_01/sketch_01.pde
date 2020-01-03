void setup(){
  size(800,800);
  background(0);
  
  //frameRate() permite cambiar la frecuencia con que se llama a la función draw
  
  frameRate(60);
}

// draw se llama constantemente mientras nuestro programa está corriendo, a una frecuencia determinada

void draw(){
  fill(255,255,255);
  
  // dibujamos un cuadrado qye aoarezca aleatoriamente
  
  rect(
    random(0,800), // posición x aleatoria 
    random(0,600), // posición y aleatoria
    20, 20
    );
}

// keyPressed. Se llama a este evento cuando presionamos una tecla
// se vuelve a llamar constantemente mientras esa tecla esté presionada

void keyPressed(){
  println("Tecla presionada" + random(0,50));
}

// keyReleased este evento es llamado cuando se suelta la tecla

void keyReleased(){
  println("tecla suelta");
}

// mousePresed se llama cuando utilizamos el boton izquierdo del mouse

void mousePressed(){

  println("Mouse soltado");}
  
void mouseMoved(){
  println("Mouse movido" + random(0,50));
}