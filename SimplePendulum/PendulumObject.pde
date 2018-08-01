class Pendulum {

  float r;
  float theta;
  float dtheta;
  float mass;

  float initial_theta;
  float initial_energy;

  float gravity = 1;

  Pendulum(float initial_theta_, float r_) {
    this.r = r_;
    this.theta = initial_theta_;
    this.dtheta = 0;
    this.mass = 1;

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

    return state_;
  }

  void updateState(float[] state) {
    this.theta = state[0];
    this.dtheta = state[1];
  }


  float[] getState() {
    float[] state = new float[2];
    state[0] = this.theta;
    state[1] = this.dtheta;

    return state;
  }

  float [] getCartesian() {
    float[] coordinates = new float[2];
    coordinates[0] = this.r * cos(this.theta);
    coordinates[1] = this.r * sin(this.theta);
    return coordinates;
  }
}
