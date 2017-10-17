class Tiempo
{
  int tiempoTranscurrido;
  int tiempoInicio;
  int limiteTiempo=60000;
  int posx, posy;
  
  Tiempo(int posx_, int posy_)
  {
    posx=posx_;
    posy=posy_;
  }

  void display()
  {
    fill (0,50,150,100);
    noStroke();
    rect (1075,675,140,30);
    fill(255);
    textAlign(LEFT);
    textFont(Raleway,16);
    text("Tiempo:",posx,posy);
    tiempoTranscurrido=(millis()-tiempoInicio);
    tiempoTranscurridoPant=tiempoTranscurrido/1000;
    tiempoPantalla=60-tiempoTranscurridoPant;
    tiempoCrear=60000-tiempoTranscurrido;
    if(tiempoInicio>0)
    {
      //println(millis()-tiempoInicio);
      textAlign(RIGHT);
      text(tiempoPantalla,posx+130,posy);
    }
  
  if(tiempoPantalla<=0 && puntos>=500)
    {
     pantalla+=1;
     fin=1;
    }
    
    if(tiempoPantalla<=0 && puntos<=500)
    {
      pantalla+=1;
      fin=2;
    }
    
  if(start==true)
  {
    tiempoInicio =millis();
    start=false;
  }
  }


}