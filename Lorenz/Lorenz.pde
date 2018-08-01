import peasy.*;

Attractor p;
PeasyCam cam;

float[] currentState = new float[3];
float[] nextState = new float[3];
ArrayList<PVector> points = new ArrayList<PVector>();

float time = 0;

float iterations = 10;

void setup() {
  size(500, 500, P3D);
  cam = new PeasyCam(this, 100);
  p = new Attractor(random(-10, 10), random(-10, 10), random(-10, 10));
}

void draw() {
  background(0);

  float h = 1 / iterations;

  for (int i = 0; i < iterations; i++) {

    nextState = euler(time, p, h);
    p.updateState(nextState);

    time += h;
  }

  // Get variables
  float x = p.getCartesian()[0];
  float y = p.getCartesian()[1];
  float z = p.getCartesian()[2];
  points.add(new PVector(x, y, z));
  // Draw stuff

  stroke(255);
  strokeWeight(3);
  beginShape();
  for (PVector point : points) {
    vertex(point.x, point.y, point.z);
  }
  endShape();
}

float[] euler(float time, Attractor p, float h) {
  float[] state =  sum(mult(p.equation(time, p.getState()), h), p.getState());
  return state;
}

float[] rungeKutta4(float time, Attractor p, float h) {
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
