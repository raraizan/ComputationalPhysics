Pendulum p; //<>//
float[] currentState = new float[2];
float[] nextState = new float[2];
float time = 0;

void setup() {
  size(500, 500, P2D);
  p = new Pendulum(random(-PI, PI), 100);
}

void draw() {
  background(255);
  // Do some logic (implement numerical methods)

  // Euler method
  float h = 0.0001;
  for (int i = 0; i < 10000; i++) {
    currentState = p.getState();

    nextState = sum(mult(p.equation(time, currentState), h), currentState) ;

    p.updateState(nextState);

    time += h;
  }

  // Get variables
  float x = p.getCartesian()[1];
  float y = p.getCartesian()[0];
  // Draw stuff

  pushMatrix();
  translate(width / 2, height / 2);
  noFill();
  stroke(0);
  ellipse(0, 0, 10, 10);
  line(0, 0, x, y);
  line(0, 0, x, y);
  noStroke();
  fill(0);
  ellipse(x, y, 10, 10);
  popMatrix();

  stroke(0);
  text("  E: " + p.energy(), 10, height - 55);
  text("E0: " + p.initial_energy, 10, height - 40);
  text("E%: " + 100 * p.energy() / p.initial_energy, 10, height - 25);
  text("e%: " + 100 * (p.energy() - p.initial_energy) / p.initial_energy, 10, height - 10);
}

void mousePressed() {
  p = new Pendulum(random(-PI, PI), 100);
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
