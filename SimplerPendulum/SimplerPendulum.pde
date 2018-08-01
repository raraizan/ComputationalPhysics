DoublePendulum dp;

float[] currentState = new float[4];
float[] nextState = new float[4];
float time;

void setup() {
  size(500, 500, P2D);
  dp = new DoublePendulum();
}

void draw() {
  background(255);
  // Do some logic (implement numerical methods)

  // Euler method
  float h = 0.0001;
  for (int i = 0; i < 10000; i++) {
    currentState = dp.getState();

    nextState = sum(mult(dp.equation(time, currentState), h), currentState) ;
    dp.updateState(nextState);

    time += h;
  }


  //// For double pendulum.
  // Get variables
  float x1 = dp.getCartesian()[0];
  float y1 = dp.getCartesian()[1];
  float x2 = dp.getCartesian()[2];
  float y2 = dp.getCartesian()[3];

  // Draw stuff
  pushMatrix();
  translate(width / 2, height / 2);

  rotate(HALF_PI);

  noFill();
  stroke(0);
  ellipse(0, 0, 10, 10);
  line(0, 0, x1, y1);
  line(x1, y1, x2, y2);

  noStroke();
  fill(0);
  ellipse(x1, y1, 10, 10);
  ellipse(x2, y2, 10, 10);
  popMatrix();

  stroke(0);
  text("  E: " + dp.energy(), 10, height - 55);
  text("E0: " + dp.initial_energy, 10, height - 40);
  text("E%: " + 100 * dp.energy() / dp.initial_energy, 10, height - 25);
  text("e%: " + 100 * (dp.energy() - dp.initial_energy) / dp.initial_energy, 10, height - 10);
}

void mousePressed() {
  dp = new DoublePendulum(random(PI), 100);
}

float[] sum(float[] x, float[] y) {
  float[] result = new float[x.length];
  for (int i = 0; i < x.length; i++) {
    result[i] = x[i] + y[i];
  }
  return result;
}

float[] mult(float[] x, float y) {
  float[] result = new float[x.length];
  for (int i = 0; i < x.length; i++) {
    result[i] = x[i] * y;
  }
  return result;
}
