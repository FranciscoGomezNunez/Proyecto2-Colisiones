void Inicio()

{
  c=5;
  fx+=c;
  if (fx>=800)
  {
    fx=0;
  }
  background(0);
  pushMatrix();
  translate(xx,yy);
  imageMode(CENTER);
  scale(agua);
  image (bl1,0,0);
  popMatrix();
  fill(255);
  
  
  textFont(Raleway,100);
  textAlign(LEFT);
  text ("HERMES",fx,150);
  
  textFont(Raleway2,70);
  textAlign(RIGHT);
  text ("tasks",fx+410,210);
  
  fill(random(255));
  textFont(Raleway,24);
  textAlign(CENTER);
  text ("Presiona A para continuar",width/2,600);
  
  noStroke();
  fill(0,0,255);
  for (particula p: particulas)
  {
    p.display();
    p.movimiento();
    p.rebote();
  }
}

class particula
{
  float x,y,v,v2,a,t,n,o;
  color c;
  particula (float x_, float y_, float v_, float a_, float t_, color c_)
  {
    x=x_;
    y=y_;
    v=v_;
    a=a_;
    t=t_;
    c=c_;
    v2=v_;
    
  }
  particula (float x_, float y_, float v_, float a_, float t_)
  {
    x=x_;
    y=y_;
    v=v_;
    a=a_;
    t=t_;
    c=color(0,0,random(255));
    v2=v_;
    
  }
  
  particula ()
  {
    x=random(400);
    y=random(400);
    v=random(10);
    a=random(TWO_PI);
    t=random(1,30);
    c=color(random(255));
  }
  
  particula (float x_,float y_)
  {
    x=x_;
    y=y_;
    v=random(10);
    a=random(TWO_PI);
    t=random(1,30);
    c=color(random(255));
  }
  
  void display()
  {
    pushMatrix();
    translate(x,y);
    noStroke();
    fill (c);
    ellipse (0,0,t,t);
    popMatrix();
  }
  
  void movimiento()
  {
    
    n=sin(a)*v;
    o=cos(a)*v2;
    x+=o;
    y+=n;
    
  }
  
  void rebote()
  {
    
    if((y<=0))
    {
      a*=-1;
    }
    
    if((y>=795))
    {
      y=0;
      t+=1;
      agua+=inc;
      if(agua==810||agua==0)
      {inc*=(-1);}
      
    }
    
    if((x<=0)||(x>=1200))
    {
      v2*=-1;
    }
    
  }
}