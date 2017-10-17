void Eleccion()
{
  x0+=inc2;
  if(x0>=1200||x0<=0)
  {
    inc2*=-1;
  }
  background(0);
  for (particula p: particulas)
  {
    p.display();
    p.movimiento();
    p.rebote();
  }
  
  fill(255);
  textFont(Raleway,20);
  textAlign(CENTER);
  text ("Selecciona una de las tareas que debe cumplir Hermes.",width/2,50);
  text("Tarea 1:",x2,530);
  text("Tarea 2:",xx,530);
  text("Tarea 3:",x3,530);
  textFont(Raleway,24);
  text("Pelotas en la playa.",x2,555);
  text("Rescata esas donas.",xx,555);
  text("Peligro en la fortaleza.",x3,555);
  fill(random(255));
  textFont(Raleway,20);
  text("Presiona 1 para realizarla.",x2,610);
  text("Presiona 2 para realizarla.",xx,610);
  text("Presiona 3 para realizarla.",x3,610);
  
  pushMatrix();
  translate(x0,y0);
  imageMode(CENTER);
  scale(0.13);
  image (bl1,0,0);
  popMatrix();
  
  pushMatrix();
  translate(x2,yy);
  imageMode(CENTER);
  scale(menu);
  image (b1,0,0);
  popMatrix();
  
  
  pushMatrix();
  translate(xx,yy);
  imageMode(CENTER);
  scale(menu);
  image (b2,0,0);
  popMatrix();
  
  pushMatrix();
  translate(x3,y2);
  imageMode(CENTER);
  scale(menu);
  image (b3,0,0);
  popMatrix();
 
  
  
}