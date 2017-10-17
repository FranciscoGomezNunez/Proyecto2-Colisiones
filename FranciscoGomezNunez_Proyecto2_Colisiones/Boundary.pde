class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  int vel;
  
  // But we also have to make a body for box2d to know about it
  Body b;
  
  

  Boundary(float x_,float y_, float w_, float h_, int vel_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    vel = vel_;
    

    // Define the polygon
    PolygonShape sd = new PolygonShape(); 
    
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
    
    b.setUserData(this);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(#E0B04F);
    noStroke();
    rectMode(CENTER);
    Vec2 pos = box2d.getBodyPixelCoord(b);
    rect(pos.x,pos.y,w,h);
  }
  
 
   void rebote()
  {
    if ((y+150)>=700)
    {
      vel*=(-1);
    }
    if ((y-150)<=0)
    {
      vel*=(-1);
    }
  }
  
  void movimiento()
  {
    y+=vel;
    Vec2 prueba = box2d.coordPixelsToWorld(x,y);
    b.setTransform(prueba,0);
  }

  
  
  

}