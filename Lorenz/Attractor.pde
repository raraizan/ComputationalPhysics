class Attractor {

  float x;
  float y;
  float z;

  float a; // sigma
  float b; // r
  float c; // b

  Attractor(float x_, float y_, float z_) {
    this.x = x_;
    this.y = y_;
    this.z = z_;

    this.a = 10;
    this.b = 28;
    this.c = 8/3;
  }

  float[] equation(float t, float[] state_) {

    float[] state = new float[3];

    state[0] = a * (state_[1] - state_[0]);
    state[1] = -state_[0] * state_[2] + b * state_[0] - state_[1];
    state[2] = state_[0] * state_[1] - c * state_[2];

    return state;
  }

  void updateState(float[] state) {
    this.x = state[0];
    this.y = state[1];
    this.z = state[1];
  }

  float[] getState() {
    float[] state = {this.x, this.y, this.z};
    return state;
  }

  float [] getCartesian() {
    float[] coordinates = {this.x, this.y, this.z};
    return coordinates;
  }
}
