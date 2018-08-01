class Particle {
  PVector pos;
  PVector vel;
  PVector force;
  float mass;

  Particle(float x_, float y_, float u_, float v_) {
    this.pos = new PVector(x_, y_);
    this.vel = new PVector(u_, v_);
    this.mass = 1;
    this.force = new PVector(0, 0);
  }

  void applyForce(PVector force_) {
    this.force.add(force_);
  }

  void update(float h) {
    this.pos.add(PVector.mult(this.vel, h));
    this.vel.add(PVector.mult(this.force, h / this.mass));
    this.force = new PVector(0, 0);
  }

}
