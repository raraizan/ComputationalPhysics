class Particle {
  float x;
  float y;
  float u;
  float v;
  float fx;
  float fy;
  float mass;

  Particle(float x_, float y_, float u_, float v_) {
    this.x = x_;
    this.y = y_;
    this.u = u_;
    this.v = v_;
    this.fx = 0;
    this.fy = 0;
    this.mass = 1;
  }

  void applyForce(float fx_, float fy_) {
    this.fx += fx_;
    this.fy += fy_;
  }

  float[] equation(float t, float[] state_) {
    float[] state = {state_[2], state_[3], fx, fy};
    return state;
  }

  void updateState(float[] state) {
    this.x = state[0];
    this.y = state[1];
    this.u = state[2];
    this.v = state[3];
  }


  float[] getState() {
    float[] state = {this.x, this.y, this.u, this.v};
    return state;
  }

  float [] getCartesian() {
    float[] coordinates = {this.x, this.y};
    return coordinates;
  }
}
