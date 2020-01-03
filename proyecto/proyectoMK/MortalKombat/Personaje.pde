class Personaje{
  //variables privadas que modificaran la posicion del personaje
  private int posX, posY;
  private String  tipo = "";
  
  //constructor de personaje que inicializa el lado donde se creara el personaje 
  public Personaje(String lado){
    tipo = lado;
    Inicializar();
    
  }
  //
  private void Inicializar(){
    if(tipo == "L"){
      posX =100;
      posY = 400;
    }
    if(tipo == "R"){
      posX=width-100;
      posY=400;
    }
    //Dibujar();
  }
  
  //actualiza el dibujo del personaje con respecto a los cambios en X y Y y se vuelve a dibujar
  public void Actualizar(int x, int y){
    posX+=x;
    posY+=y;  
    println("x:" + posX + " y:" +posY);
    Dibujar();
  }
  
  //dibuja el personaje a utilizar
  public void Dibujar(){
    if(tipo == "L"){
      strokeWeight(5);
      fill(0,255,0);
      line(posX,posY,posX,posY+100); // cuello y cuerpo
      ellipse(posX,posY,50,50); // cabeza
      line(posX,posY+100,posX-30,posY+150); // pierna izquierda
      line(posX,posY+100,posX+30,posY+150); // pierna derecha
      line(posX,posY+50,posX+30,posY+50); // brazo
      line(posX+30,posY+50,posX+50,posY+40); // puño
    }
    if(tipo == "R"){
      strokeWeight(5);
      fill(0,255,0);
      //cuerpo
      line(posX,posY,posX,posY+100);
      //cabeza
      ellipse(posX,posY,50,50);
      //piernas
      line(posX,posY+100,posX-30,posY+150);
      line(posX,posY+100,posX+30,posY+150);
      //brazos
      line(posX,posY+50,posX-30,posY+50);
      line(posX-30,posY+50,posX-50,posY+40);
    }
}
  // definicion del salto del personaje
  public void Brincar(){
    
      for(int i = 400; i >= 200; i-=5)// brinca hacia arriba hasta el punto maximo
      {
       posY = i; 
       Dibujar();
      }
      
      for(int j = 200; j <= 400; j+=5)//cae hasta punto inicial
      {
        posY = j;
        Dibujar();
      }
      
  }
  

}