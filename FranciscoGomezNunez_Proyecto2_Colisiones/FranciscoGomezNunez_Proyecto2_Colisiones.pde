
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

// Just a single box this time
Box box;

// An ArrayList of particles that will fall on the surface
ArrayList<Particle> particles;
ArrayList<CC> cc;

// The Spring that will attach to the box from the mouse
Spring spring;
Boundary wall;
Boundary wall1;
Piso wall2;

Juego juego;

Puntuacion puntuacion;
Tiempo tiempo;
Muestra muestra;

// Perlin noise values
float xoff = 0;
float yoff = 1000;
int pantalla;
PImage fondo, fondo2, fondo3;
PImage bl1;
 PImage b1, b2, b3;
 
PFont Raleway;
PFont Raleway2;
PFont Raleway3;
int fx, fx2, c,xx=600,yy=350,x2=300,x3=900,y2=320,x0=1,y0=100, inc2=5;
float agua=0.3, inc=0.01, menu=0.8;
ArrayList <particula> particulas;


String tar1,tar2,tar3;
String fin1,fin2;
int fin;
  

int tarea, Fondo;

int puntos;

int ins;
boolean start;
int tiempoTranscurridoPant;
int tiempoTranscurrido;
int tiempoInicio;
int limiteTiempo=60000;
int tiempoPantalla;
int tiempocc;
int tiempoCrear;





void setup() {
  size(1200,700);
  smooth();
  fondo = loadImage("FondoBomba.jpg");
  fondo2 = loadImage("Panaderíaa.jpg");
  fondo3 = loadImage("playa.jpg");
  bl1 = loadImage("Block1.png");
  b1 = loadImage("b1.png");
  b2 = loadImage("b2.png");
  b3 = loadImage("b3.png");
  Raleway = loadFont("Raleway-Bold-48.vlw");
  Raleway2 = loadFont("Raleway-SemiBoldItalic-48.vlw");
  Raleway3 = loadFont("Raleway-Thin-48.vlw");
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  // Turn on collision listening!
  box2d.listenForCollisions();

  // Make the box
  box = new Box(width/2,height/2);

  // Make the spring (it doesn't really get initialized until the mouse is clicked)
  spring = new Spring();
  spring.bind(width/2,height/2,box);

  // Create the empty list
  particles = new ArrayList<Particle>();
  cc = new ArrayList<CC>();
  
  juego = new Juego();
  wall = new Boundary(30, 350, 60, 300,2);
  wall1 = new Boundary(1170, 350, 60, 300,2);
  wall2 = new Piso(width/2, height-5, width, 10);
  puntuacion = new Puntuacion(60,680);
  tiempo = new Tiempo(1010,680);
  muestra = new Muestra();
  
  
  particulas = new ArrayList<particula>();
  for (int i=0; i<10; i++)
  {
    particulas.add(new particula(random(1200),random(700),1,0.125*(PI),random(5,20)));
    particulas.add(new particula(random(1200),random(700),1,0.625*(PI),random(5,20)));
    particulas.add(new particula(random(1200),random(700),1,0.375*(PI),random(5,20)));
    particulas.add(new particula(random(1200),random(700),1,0.875*(PI),random(5,20)));
  }


  tar1="Hermes está en la playa, debe lanzar las pelotas que están cayendo para guardarlas en las cajas que están en movimiento. Para lanzar las pelotas mueve a Hermes presionando el mouse y golpea la pelota. Cada pelota en la caja tiene un valor de 25 puntos, tienes un minuto para obtener por lo menos 500 puntos. Si tocas una caja ambas se cerrarán.";
  tar2="Hermes está en la panadería, se han caído las donas y debe rescatarlas para guardarlas en las cajas en movimiento. Para lanzar las donas mueve a Hermes presionando el mouse y golpea la dona. Cada dona en la caja tiene un valor de 25 puntos, tienes un minuto para obtener por lo menos 500 puntos. Si tocas una caja ambas se cerrarán";
  tar3="Hermes está en una fortaleza, sus enemigos le arrojan bombas, debe lanzarlas a las cajas de desactivación. Para lanzar las bombas mueve a Hermes presionando el mouse y golpea la bomba. Cada bomba desactivada tiene un valor de 25 puntos, tienes un minuto para obtener por lo menos 500 puntos. Si tocas una caja ambas se cerrarán";
  fin1="¡Felicidades! ¡Haz completado la tarea! Presiona A para completarla nuevamente o elegir otra tarea.";
  fin2="Lo sentimos, no haz completado la tarea. Presiona A para intentarlo nuevamente o elegir otra tarea.";
}


void draw() 
{ switch (pantalla)
  { case 0:
    Inicio();
    keyPressed();
      if ((key=='a')||(key=='A')){
      pantalla+=1;
      }
    break;
    case 1:
    Eleccion();
    keyPressed();
    if (key=='1')
    {
      tarea=1;
      Fondo=1;
      ins=1;
      pantalla+=1;
    }
    if (key=='2')
    {
      tarea=2;
      Fondo=2;
      ins=2;
      pantalla+=1;
    }
    if (key=='3')
    {
      tarea=3;
      Fondo=3;
      ins=3;
      pantalla+=1;
    }
    break;
    case 2:
    Instrucciones();
    keyPressed();
    if((key=='a')||(key=='A'))
    {
      pantalla+=1;
      start=true;
    }
    break;
    case 3:
    juego.display();
    break;
    case 4:
    Final();
    keyPressed();
    if((key=='f')||(key=='F'))
    {
      pantalla+=1;
    }
    break;
    case 5:
    finali();
    break;
  }
}

class Inicio
{
  
}
class Juego
{
  void display()
  {
  
  background(255);
  
  switch (Fondo)
  {
    case 1:
    image(fondo3,600,350);
    break;
    case 2:
    image(fondo2,600,350);
    break;
    case 3:
    image(fondo,600,350);
    break;
  }
  
  
  tiempo.display();
  tiempocc=millis();
  if (random(1) < 0.007) {
    float sz = 40;
    particles.add(new Particle(width/2,-20,sz));
  }
  
  

  
  // We must always step through time!
  box2d.step();
  
  
  // Instead update the spring which pulls the mouse along
  if (mousePressed) {
    spring.update(mouseX,mouseY);
    spring.display();
  } 
  box.body.setAngularVelocity(0);

  // Look at all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }

  // Draw the box
  box.display();
  wall.display();
  wall.movimiento();
  wall.rebote();
  wall1.display();
  wall1.movimiento();
  wall1.rebote();
  
  puntuacion.display();
  
 
  }
  
}


// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Boundary.class) {
    Particle p = (Particle) o2;
    p.delete();
    puntuacion.Puntos();
  }
  if (o2.getClass() == Boundary.class) {
    Particle p = (Particle) o1;
    p.delete();
    puntuacion.Puntos();
  }
  
  
  
 
}


// Objects stop touching each other
void endContact(Contact cp) {
}