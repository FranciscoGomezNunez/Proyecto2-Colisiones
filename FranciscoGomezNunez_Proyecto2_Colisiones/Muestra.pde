void finali()
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
  muestra.display();
}

class Muestra
{
  float delta;
  void display() {
  //background(0);
 

  if (random(1) < 0.1) {
    float sz = 10;
    cc.add(new CC(random(width), 20, sz));
  }
  
  if (mousePressed) {
    float sz =8;
    cc.add(new CC(mouseX, mouseY, sz));
  }
  


  // We must always step through time!
  box2d.step();

  // Look at all particles
  for (int i = cc.size()-1; i >= 0; i--) {
    CC c1 = cc.get(i);
    c1.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (c1.done()) {
      cc.remove(i);
    }
  }

  wall2.display();
}

}

class CC {

  // We need to keep track of a Body and a radius
  Body body;
  float r;

  color col;

  boolean delete = false;

  CC(float x, float y, float r_) {
    r = r_;
    // This function puts the particle in the Box2d world
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(175);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  void delete() {
    delete = true;
  }

  // Change color when hit
  void change() {
    col = color(255, 0, 0);
  }

  // Is the particle ready for deletion?
  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2 || delete) {
      killBody();
      return true;
    }
    return false;
  }
  // 
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    scale(0.05);
    imageMode(CENTER);
    image(bl1,0, 0);
    popMatrix();
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 3;

    // Attach fixture to body
    body.createFixture(fd);

    body.setAngularVelocity(random(-10, 10));
  }
}

class Piso {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Piso(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

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
    fill(random(0,20),0,random(50,150));
    noStroke();
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}