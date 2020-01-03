class Personaje{
  private int posX, posY;
  private String  tipo = "";
  
  
  public Personaje(String lado){
    tipo = lado;
    Inicializar();
    
  }
  
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
  
  public void Actualizar(int x, int y){
    posX+=x;
    posY+=y;  
    Dibujar();
  }
  
  public void Dibujar(){
    if(tipo == "L"){
      strokeWeight(5);
      fill(0,255,0);
      line(posX,posY,posX,posY+100);
      ellipse(posX,posY,50,50);
      line(posX,posY+100,posX-30,posY+150);
      line(posX,posY+100,posX+30,posY+150);
      line(posX,posY+50,posX+30,posY+50);
      line(posX+30,posY+50,posX+50,posY+40);
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
  public void Brincar(){
    
      for(int i = posY; i > 200; i-=5)
      {Actualizar(posX, i);}
      for(int j = posY; j < 400; j+=5)
      {Actualizar(posX, j);}
  }
}