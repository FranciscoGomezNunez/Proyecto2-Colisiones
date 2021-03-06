
class Particle {

  // We need to keep track of a Body and a radius
  Body body;
  float r;

  color col,col1,col2;
  
  boolean delete = false;
 


  Particle(float x, float y, float r_) {
    r = r_;
    // This function puts the particle in the Box2d world
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(#D9E038);
    col1 = color(#AFB42E);
    col2 = color(#3788DB);
   
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Change color when hit
  void delete() {
    delete=true;
  }

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
    /*pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    scale(.26);
    imageMode(CENTER);
    image(b3,0,0);
    popMatrix();*/
    switch(tarea)
    {
      case 1:
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    scale(.26);
    imageMode(CENTER);
    image(b1,0,0);
    popMatrix();
    break;
    case 2:
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    scale(.26);
    imageMode(CENTER);
    image(b2,0,0);
    popMatrix();
    break;
    case 3:
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    scale(.26);
    imageMode(CENTER);
    image(b3,0,0);
    popMatrix();
    break;
    
    }
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
    fd.friction = 0.01;
    fd.restitution = 0.3;

    // Attach fixture to body
    body.createFixture(fd);

    body.setAngularVelocity(random(-10, 10));
  }
}