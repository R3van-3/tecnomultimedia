PImage miImagen1;
PImage miImagen2;
PImage miImagen3;
PImage miBoton;
int imagenActual = 1;
boolean seguirCambiando = true;
int tiempoUltimoCambio = 0;
int tiempoEntreCambios = 4000;
float textoPosY;
float textoPosY2;
float textoPosY3;
float velocidadTexto = 1.5 ;

int botonX = 550;
int botonY = 430;
int botonAncho = 80;
int botonAlto = 30;

void setup() {
  size(640, 480);
  miImagen1 = loadImage("atlantis-1.jpg");
  miImagen2 = loadImage("atlantis-2.jpg");
  miImagen3 = loadImage("atlantis-3.jpg");
  miBoton = loadImage("boton-reiniciar.jpg");
  
  textoPosY = -100;
  textoPosY2 = -100;
  textoPosY3 = -100;
}

void draw() {
  background(0);
  if (imagenActual == 1) {
    image(miImagen1, 0, 0, 640, 480);
    fill(255);
    textSize(50);
    textAlign(LEFT, TOP);
    if(textoPosY < 50) {
      textoPosY += velocidadTexto;
    }
    text("El transbordador espacial Atlantis fue uno de los transbordadores de la flota perteneciente a la Administración Nacional.", 20, textoPosY, 600, 440);
  } else if (imagenActual == 2) {
    image(miImagen2, 0, 0, 640, 480);
    fill(255);
    textSize(50);
    textAlign(LEFT, TOP);
    if(textoPosY2 < 50) {
      textoPosY2 += velocidadTexto;
    }
    text("El Atlantis realizó su primer vuelo en octubre de 1985, realizando actividades militares clasificadas.", 20, textoPosY2, 600, 440);  
  } else if (imagenActual == 3) { 
    image(miImagen3, 0, 0, 640, 480);
    fill(255);
    textSize(50);
    textAlign(LEFT, TOP);
    if(textoPosY3 < 50) {
      textoPosY3 += velocidadTexto;
    }
    text("Con el último vuelo del Atlantis se cierra la era de los Transbordadores Espaciales después de 30 años.", 20, textoPosY3, 600, 440);
    image(miBoton, botonX, botonY, botonAncho, botonAlto);
    seguirCambiando = false;
  }

  if (textoPosY > height) {
    textoPosY = -50;
  }
  if (textoPosY2 > height) {
    textoPosY2 = -50;
  }
  if (textoPosY3 > height) {
    textoPosY3 = -50;
  }
  
  if (seguirCambiando && millis() - tiempoUltimoCambio > tiempoEntreCambios) {
    if (imagenActual == 1) {
      imagenActual = 2;
      textoPosY = -100;
    } else if (imagenActual == 2) {
      imagenActual = 3;
      textoPosY2 = -100;
      } else if (imagenActual == 3) {
      imagenActual = 1;
      textoPosY3 = -100;
    }
    tiempoUltimoCambio = millis();
  }
}

void mouseClicked() {
  if (imagenActual == 3 && mouseX > botonX && mouseX < botonX + botonAncho && mouseY > botonY && mouseY < botonY + botonAlto) {
    imagenActual = 1;
    seguirCambiando = true;
    tiempoUltimoCambio = millis();
    // reiniciar las posiciones de texto
    textoPosY = -100;
    textoPosY2 = -100;
    textoPosY3 = -100;
  }
}
