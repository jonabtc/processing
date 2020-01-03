
PImage imagenMain, imagenJuego, imagenHistoria, imagenCreditos;
int inicioBotonX, inicioBotonY;
color colorPrincipal, colorSecundario, colorPrincipalH, colorSecundarioH;
String historia[], escenarios[];
boolean textFlag;
boolean mapaSelected = false; // Verifica si el escenario ya fue seleccionado



/*variables relacionadas con la pantalla GAME*/

String[] start = new String[3]; 
PFont f; 
PImage mapa;
int tiempo = 60;
float m;
Personaje lpersonaje, rpersonaje;

//se establece 4 tipos de pantalla en la que puede estar durante la ejecución

enum Pantalla {MAIN, HISTORY, CREDITS, GAME};


Pantalla tipo; // para saber en que pantalla estamos


void setup(){
  
  // -> configuracion visualización
  
  //fullScreen();
  size(900, 600);
  //frameRate(120);   
  
  // -> variables referencia punto medio de la pantalla
  
  inicioBotonX = width/2;
  inicioBotonY = height/2;
  
  // -> variables de imagenes
  
  imagenMain = loadImage("recursos/imagenes/mainBackground.jpg");
  imagenMain.resize(width,height);
  imagenHistoria = loadImage("recursos/imagenes/historyBackground.jpg");
  imagenHistoria.resize(width,height);
  imagenCreditos = loadImage("recursos/imagenes/creditsBackground.gif");
  imagenCreditos.resize(width,height);
    
  
  // -> variables de Texto
  
  historia = loadStrings("recursos/texto/history.txt");
  String escena [] = loadStrings("recursos/texto/escenarios.txt");
  escenarios = escena[0].split("##");
  // -> variables de color
  
  colorPrincipal = color(184, 134, 11);  //Botón jugar
  colorSecundario = color(153, 50, 204); //Otros botones
  
  colorPrincipalH = color(220, 167, 34); //Botón jugar hangover
  colorSecundarioH = color(147,112,219); //Otros botones hangover
  
  // -> variables de control
  
  tipo = Pantalla.MAIN;
  textFlag = false; // controla si ya terminó de imprimir el texto
  
  /*  Utilizados para la pantalla MAIN*/
  start[0] = "READY";
  start[1] = "FIGHT";
  start[2] = "00";
  f =  createFont("LaoUI-Bold-48", 40); 
  frameRate(30);
  mapa = loadImage("recursos/imagenes/escenario7.gif");
  mapa.resize(width,height);
  
  lpersonaje  = new Personaje("L");//personaje izquierdo
  rpersonaje = new Personaje("R");//personaje derecho
  
}

void draw(){
    
  if(tipo == Pantalla.MAIN){
    
     background(imagenMain);
     
     /*    controlamos hangover de los botones */
         
     if(mouseX >= inicioBotonX-100 && mouseX <= inicioBotonX+100 && (
        (mouseY >= inicioBotonY-85 && mouseY <= inicioBotonY-35) ||
        (mouseY >= inicioBotonY-25 && mouseY <= inicioBotonY+25) ||
        (mouseY >= inicioBotonY+35 && mouseY <= inicioBotonY+85) )){
       
       if(mouseY >= inicioBotonY-85 && mouseY <= inicioBotonY-35) dibujarBotones(1);
         
       if(mouseY >= inicioBotonY-25 && mouseY <= inicioBotonY+25) dibujarBotones(2);
       
       if(mouseY >= inicioBotonY+35 && mouseY <= inicioBotonY+85) dibujarBotones(3);
            
     }else{
       dibujarBotones(0);        
     }
  }
  
  if(tipo == Pantalla.HISTORY){
    
    background(imagenHistoria);
    
    /* controlamos hangover de boton regresar*/
    if(mouseX >= width-100 && mouseX <=width &&
       mouseY >= height-50 && mouseY <=height){
       dibujarbotonBack(true);  
    }else{
      dibujarbotonBack(false);  
    }
    
      textSize(32);
      fill(250);
      text(historia[0], inicioBotonX-300, inicioBotonY-300, 500, 800);
      
    
  }
  
  if(tipo == Pantalla.CREDITS){
    background(imagenCreditos);
    /* controlamos hangover de boton regresar*/
    if(mouseX >= width-100 && mouseX <=width &&
       mouseY >= height-50 && mouseY <=height){
       dibujarbotonBack(true);  
    }else{
      dibujarbotonBack(false);  
    }
  }
  if(tipo == Pantalla.GAME){
    
    background(140,20,5);
    
    /*if(!mapaSelected){
      for(int i=0; i < escenarios.length; i++){
        println(escenarios[i]);
        mapaSelected=true;
      }
    }else{
    
    }*/
    //------------------------------------------mapa------------------------------------------------------------------------------
   image(mapa,0,0);
  //--------------------------------------personaje de prueba-------------------------------------------------------------------
   rpersonaje.Dibujar();
   lpersonaje.Dibujar();
  //-----------------------------------------timer--------------------------------------------------------------------------------
  m = millis()/1000;  
 
  if(tiempo > 0)
    tiempo = tiempo - (int)m;
  else
    tiempo = 0;
    
  translate(width/2, height/2);  
  textFont(f); 
  textAlign(CENTER); 
  text(tiempo, 0 , -250);
  }
  
}

// manejador de eventos del mouse
void mouseReleased(){
  // controlamos en qué pantalla se encuentra, por medio de la variable 'tipo'
  
  if(tipo == Pantalla.MAIN){
    
    /*controlamos donde se ha presionado el mouse en la pantalla principal y si se preciono el boton se le asigna su respectivo 
      valor del botón a la  variable 'tipo'
      */
      
    if(mouseX >= inicioBotonX-100 && mouseX <= inicioBotonX+100 && (
          (mouseY >= inicioBotonY-85 && mouseY <= inicioBotonY-35) ||
          (mouseY >= inicioBotonY-25 && mouseY <= inicioBotonY+25) ||
          (mouseY >= inicioBotonY+35 && mouseY <= inicioBotonY+85) )){
         
         if(mouseY >= inicioBotonY-85 && mouseY <= inicioBotonY-35) 
           tipo = Pantalla.GAME;           
         if(mouseY >= inicioBotonY-25 && mouseY <= inicioBotonY+25) 
           tipo = Pantalla.HISTORY;         
         if(mouseY >= inicioBotonY+35 && mouseY <= inicioBotonY+85) 
           tipo = Pantalla.CREDITS;
    }  
  }
  
  if(tipo == Pantalla.GAME){
  
  }
  
  if(tipo == Pantalla.HISTORY){
    /* controlamos el click del boton BACK para regresar al menu principal*/
    if(mouseX >= width-100 && mouseX <=width &&
       mouseY >= height-50 && mouseY <=height)
       tipo = Pantalla.MAIN;
  }
  
  if(tipo == Pantalla.CREDITS){
    /* controlamos el click del boton BACK para regresar al menu principal*/
    if(mouseX >= width-100 && mouseX <=width &&
       mouseY >= height-50 && mouseY <=height)
       tipo = Pantalla.MAIN;
  }
}

  /*método utilizado para dibujar los botones en la pantalla principal
    el argumento de tipo entero que recibe, sirve para saber a qué boton 
    afectara algún movimiento del mouse y así afectar su color
    
    y el argumento de tipo booleano nos sirve para ver si el boton afectado
    es el de BACK util solo en la pantalla de CREDITO e HISTORIA
  */


void dibujarBotones(int i){
  
  color colorBotonJugar, colorBotonHistoria, colorBotonCreditos;
  color txtBtnJugar=color(0), txtBtnHistoria=color(0), txtBtnCreditos=color(0);
  
  //seteamos los colores y 
  switch(i){
    case 1:
        colorBotonJugar = colorPrincipalH;
        colorBotonHistoria = colorSecundario;
        colorBotonCreditos = colorSecundario;
        txtBtnJugar = color(250);
        break;
        
    case 2:
        colorBotonJugar = colorPrincipal;
        colorBotonHistoria = colorSecundarioH;
        colorBotonCreditos = colorSecundario;
        txtBtnHistoria = color(250);
        break;
        
    case 3:
        colorBotonJugar = colorPrincipal;
        colorBotonHistoria = colorSecundario;
        colorBotonCreditos = colorSecundarioH;
        txtBtnCreditos = color(250);
        break;
        
    default:
        colorBotonJugar = colorPrincipal;
        colorBotonHistoria = colorSecundario;
        colorBotonCreditos = colorSecundario;
        txtBtnJugar = color(0);
        txtBtnHistoria = color(0);
        txtBtnCreditos = color(0);
  }
  
  // -> -> dibujamos los botones
  
        /*      BOTON JUGAR      */
        
        fill(colorBotonJugar);
        
        quad(inicioBotonX-100,inicioBotonY-85,
               inicioBotonX+100,inicioBotonY-85,
               inicioBotonX+100,inicioBotonY-35,
               inicioBotonX-100,inicioBotonY-35);  
        // ponemos texto en el botón
        textSize(32);
        fill(txtBtnJugar);
        text("JUGAR", inicioBotonX-50, inicioBotonY-50);
        
        
        /*      BOTON HISTORIA      */
               
        fill(colorBotonHistoria);
        
        quad(inicioBotonX-100,inicioBotonY-25,
               inicioBotonX+100,inicioBotonY-25,
               inicioBotonX+100,inicioBotonY+25,
               inicioBotonX-100,inicioBotonY+25); 
        // ponemos texto en el botón
        textSize(32);
        fill(txtBtnHistoria);
        text("HISTORIA", inicioBotonX-70, inicioBotonY+10);
        
        /*      BOTON CREDITOS      */
        
        fill(colorBotonCreditos);
        
        quad(inicioBotonX-100,inicioBotonY+35,
               inicioBotonX+100,inicioBotonY+35,
               inicioBotonX+100,inicioBotonY+85,
               inicioBotonX-100,inicioBotonY+85); 
        // ponemos texto en el botón
        textSize(32);
        fill(txtBtnCreditos);
        text("CREDITOS", inicioBotonX-70, inicioBotonY+70);
        
        /*  Colocamos el texto a los botones */
      
       textSize(32);
       fill(0);
       
       
       
       
}

      /*En caso de que nos encontremos en la pantalla de créditos o de
       historia crearemos un botón que nos permita regresar al menú 
       principal para esto debemos controlar que la variable tipo sea
       igual a HISTORY o CREDITS el método recibe un argumento booleano el cual
       nos permite ver si el mouse se encuentra sobre él o no y poder setar así
       el color necesario*/
void dibujarbotonBack(boolean a){
  
       /*Aquí seteamos el color del boton BACK dependiendo si se encuentra 
       hangover o no*/
       
       color txtBtnBack= (a)?color(255):color(#FF0000);
       
       if(tipo == Pantalla.HISTORY || tipo == Pantalla.CREDITS){
         fill(0);
          quad(width-100,height-50,
                width, height-50, 
                width, height,
                width-100, height);
          textSize(32);
          fill(txtBtnBack);
          text("BACK", width-90, height-10);
       }
}

/*Setea las imagines de los creditos*/
void creditos(){}

/*Controla los eventos al presionar una tecla*/

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
  if(key == 's' || key == 's')
    {}

}

void keyReleased(){
  fill(255,0,0); 
  
  textFont(f); 
  textAlign(CENTER); 
  text(start[1], 0 , 0);
}