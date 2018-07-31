class DoublePendulum {

  float r1;
  float r2;

  float theta1;
  float theta2;

  float dtheta1;
  float dtheta2;

  float initial_theta1;
  float initial_theta2;
  float initial_energy;
  float mass1, mass2;

  float gravity = 1;

  DoublePendulum(float initial_theta1_, float initial_theta2_, float r1_, float r2_) {
    this.theta1 = initial_theta1_;
    this.theta2 = initial_theta2_;   
    this.dtheta1 = 0;
    this.dtheta2 = 0;
    this.r1 = r1_;
    this.r2 = r2_;

    this.initial_theta1 = initial_theta1_;
    this.initial_theta2 = initial_theta2_; 
    this.initial_energy = this.energy();
  }

  DoublePendulum(float initial_theta1_, float initial_theta2_) {
    this.theta1 = initial_theta1_;
    this.theta2 = initial_theta2_;   
    this.dtheta1 = 0;
    this.dtheta2 = 0;
    this.r1 = 100;
    this.r2 = 100;

    this.initial_theta1 = initial_theta1_;
    this.initial_theta2 = initial_theta2_; 
    this.initial_energy = this.energy();
  }

  DoublePendulum() {
    this.theta1 = random(-PI, PI);
    this.theta2 = random(-PI, PI);
    this.dtheta1 = 0;
    this.dtheta2 = 0;
    this.r1 = 100;
    this.r2 = 100;

    this.initial_theta1 = this.theta1;
    this.initial_theta2 = this.theta1; 
    this.initial_energy = this.energy();
  }

  float energy() {
    float potential = (this.mass1 + this.mass2) * this.gravity * this.r1 * (1 - cos(this.theta1)) + this.mass2 * this.gravity * this.r2 * (1 - cos(this.theta2));
    float kinetic = this.r1 * this.r1 * this.dtheta1 * this.dtheta1 + this.r2 * this.r2 * this.dtheta2 * this.dtheta2;
    kinetic += 2 * this.r1 * this.r2 * this.dtheta1 * this.dtheta2 * cos(this.theta1 - this.theta2);
    kinetic *= 0.5 * this.mass1 * this.r1 * this.r2 * this.dtheta1 * this.dtheta1 + 0.5 * this.mass2;
    return kinetic + potential;
  }

  float[] equation(float t, float[] state_) {

    float[] state = new float[4];
    float theta1 = state_[0];
    float theta2 = state_[1];
    float dtheta1 = state_[2];
    float dtheta2 = state_[3];

    float num1 = -this.gravity * (2 * this.mass1 + this.mass2) * sin(theta1);
    float num2 = -this.mass2 * this.gravity * sin(theta1 - 2 * theta2);
    float num3 = -2 * this.mass2 * sin(theta1 - theta2);
    float num4 = dtheta2 * dtheta2 * this.r2 + dtheta1 * dtheta1 * this.r1 * cos(theta1 - theta2);
    float num5 = 2 * sin(theta1 - theta2);
    float num6 = dtheta1 * dtheta1 * this.r1 * (this.mass1 + this.mass2);
    float num7 = this.gravity * (this.mass1 + this.mass2) * cos(theta1);
    float num8 = dtheta2 * dtheta2 * this.r2 * this.mass2 * cos(theta1 - theta2);
    float num9 = 2 * this.mass1 + this.mass2 - this.mass2 * cos(2 * theta1 - 2 * theta2);

    state[0] = state_[2];
    state[1] = state_[3];
    state[2] = (num1 + num2 + num3 * num4) / (this.r1 * num9);
    state[3] = (num5 * (num6 + num7 + num8)) / (this.r2 * num9);

    return state;
  }

  void update(float[] state) {
    this.theta1 = state[0];
    this.theta2 = state[1];
    this.dtheta1 = state[2];
    this.dtheta2 = state[3];
  }

  float [] getCartesian() {
    float[] coordinates = new float[4];
    coordinates[0] = this.r1 * cos(this.theta1);
    coordinates[1] = this.r1 * sin(this.theta1);
    coordinates[2] = this.r2 * cos(this.theta2) + coordinates[0];
    coordinates[3] = this.r2 * sin(this.theta2) + coordinates[1];
    return coordinates;
  }
}
