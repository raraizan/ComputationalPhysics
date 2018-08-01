Pendulum p; //<>//
Pendulum q;

float[] pcurrentState = new float[2];
float[] pnextState = new float[2];
float[] qcurrentState = new float[2];
float[] qnextState = new float[2];
float time = 0;

float iterations = 2048;

void setup() {
  size(500, 500, P2D);
  float ang0 = random(-PI, PI);
  p = new Pendulum(ang0, 100);
  q = new Pendulum(ang0, 100);
}

void draw() {
  background(255);
  // Do some logic (implement numerical methods)

  // Euler method
  float h = 1 / iterations;
  for (int i = 0; i < iterations; i++) {
    pnextState = euler(time, p, h);
    p.updateState(pnextState);

    qnextState = rungeKutta4(time, q, h);
    q.updateState(qnextState);
  }
  // Get variables
  float xp = p.getCartesian()[1];
  float yp = p.getCartesian()[0];
  float xq = q.getCartesian()[1];
  float yq = q.getCartesian()[0];

  // Draw stuff in here
  pushMatrix();
  translate(width / 2, height / 2);
  noFill();
  stroke(0);
  ellipse(0, 0, 10, 10);

  line(0, 0, xp, yp);
  line(0, 0, xq, yq);
  noStroke();
  fill(0, 255, 0);
  ellipse(xp, yp, 10, 10);
  fill(0, 0, 255);

  ellipse(xq, yq, 10, 10);

  popMatrix();

  stroke(0);

  text("  E: " + p.energy(), 10, height - 55);
  text("E0: " + p.initial_energy, 10, height - 40);
  text("E%: " + 100 * p.energy() / p.initial_energy, 10, height - 25);
  text("e%: " + 100 * (p.energy() - p.initial_energy) / p.initial_energy, 10, height - 10);

  text("  E: " + q.energy(), 120, height - 55);
  text("E0: " + q.initial_energy, 120, height - 40);
  text("E%: " + 100 * q.energy() / q.initial_energy, 120, height - 25);
  text("e%: " + 100 * (q.energy() - q.initial_energy) / q.initial_energy, 120, height - 10);
}

void mousePressed() {
  p = new Pendulum(random(-PI, PI), 100);
}

float[] euler(float time, Pendulum p, float h) {
  float[] state =  sum(mult(p.equation(time, p.getState()), h), p.getState());
  return state;
}

float[] rungeKutta4(float time, Pendulum p, float h) {
  float[] h1 = mult(p.equation(time, p.getState()), h);
  float[] h2 = mult(p.equation(time + 0.5 * h, sum(p.getState(), mult(h1, 0.5))), h);
  float[] h3 = mult(p.equation(time + 0.5 * h, sum(p.getState(), mult(h2, 0.5))), h);
  float[] h4 = mult(p.equation(time + h, sum(p.getState(), h3)), h);

  float[] state = h1;
  state = sum(state, h2);
  state = sum(state, h3);
  state = sum(state, h4);
  state = mult(state, 0.1666);
  state = sum(state, p.getState());
  return state;
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
