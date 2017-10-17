void Instrucciones()
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
  
  fill(random(255));
  textFont(Raleway,30);
  textAlign(CENTER);
  text ("Presiona A para continuar",width/2,600);
  
  pushMatrix();
  translate(x0,y0+370);
  imageMode(CENTER);
  scale(0.13);
  image (bl1,0,0);
  popMatrix();
  
  switch (ins)
  {
    case 1:
    fill(255);
    textFont(Raleway,40);
    textAlign(CENTER);
    text (tar1,100,50,1000,600);
    break;
    case 2:
    fill(255);
    textFont(Raleway,40);
    textAlign(CENTER);
    text (tar2,100,50,1000,600);
    break;
    case 3:
    fill(255);
    textFont(Raleway,40);
    textAlign(CENTER);
    text (tar3,100,50,1000,600);
    break;
    
  }
}