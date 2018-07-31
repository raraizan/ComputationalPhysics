class Pendulum {

  float r;
  float theta;
  float dtheta;

  float initial_theta;
  float initial_energy;
  float mass;

  float gravity = 1;

  Pendulum(float initial_theta_, float r_) {
    this.theta = initial_theta_;
    this.dtheta = 0;
    this.r = r_;

    this.initial_theta = initial_theta_;
    this.initial_energy = this.energy();
  }

  float energy() {
    float potential = this.mass * this.gravity * this.r * (1 - cos(this.theta));
    float kinetic = 0.5 * this.mass * this.r * this.r * this.dtheta * this.dtheta;
    return kinetic + potential;
  }

  float[] equation(float t, float[] state_) {

    float[] state = new float[2];
    float theta = state_[0];
    float dtheta = state_[1];
    float w2 = this.gravity / this.r;
    
    state[0] = dtheta;
    state[1] = w2 * sin(theta);

    return state;
  }

  void update(float[] state) {
    this.theta = state[0];
    this.dtheta = state[1];
  }

  float [] getCartesian() {
    float[] coordinates = new float[4];
    coordinates[0] = this.r * cos(this.theta);
    coordinates[1] = this.r * sin(this.theta);
    return coordinates;
  }
}
