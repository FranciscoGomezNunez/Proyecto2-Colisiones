class Puntuacion
{
  int posx, posy;
  
  Puntuacion(int posx_,int posy_)
  {
    posx=posx_;
    posy=posy_;
    
  }
  
  void Puntos()
  {
    puntos+=25;
  }
  
  void display()
  {
    fill (0,50,150,100);
    rect (125,675,140,30);
    fill(255);
    textAlign(LEFT);
    textFont(Raleway,16);
    text("Puntuación:",posx,posy);
    textAlign(RIGHT);
    text(puntos,posx+130,posy);
  }
  
  
}