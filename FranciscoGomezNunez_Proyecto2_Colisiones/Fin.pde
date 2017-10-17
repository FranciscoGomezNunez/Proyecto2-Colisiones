void Final()
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
  textFont(Raleway,30);
  textAlign(CENTER);
  text ("El juego ha terminado",width/2,100);
  
  pushMatrix();
  translate(x0,y0+370);
  imageMode(CENTER);
  scale(0.13);
  image (bl1,0,0);
  popMatrix();
  
  switch (fin)
  {
    case 1:
    fill(255);
    textFont(Raleway,40);
    textAlign(CENTER);
    text ("¡Felicidades! ¡Haz completado la tarea!",600,200);
    text ("Presiona F para continuar",600,400);
    break;
    case 2:
    fill(255);
    textFont(Raleway,40);
    textAlign(CENTER);
    text ("Lo sentimos, no haz completado la tarea.",600,200);
    text ("Presiona F para continuar.",600,400);
    break;
    
    
  }
}