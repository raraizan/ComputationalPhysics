DoublePendulum dp;
DoublePendulum dq;

float[] pcurrentState = new float[4];
float[] pnextState = new float[4];
float[] qcurrentState = new float[4];
float[] qnextState = new float[4];
<<<<<<< HEAD
float time;

float iterations = 2048;
=======

float x1p = 0;
float y1p = 0;
float x2p = 0;
float y2p = 0;

float x1q = 0;
float y1q = 0;
float x2q = 0;
float y2q = 0;

float x2pp = 0;
float y2pp = 0;
float x2qp = 0;
float y2qp = 0;
float time;

float iterations = 1024;
>>>>>>> Finished

PGraphics canvas;
int frames = 0;
void setup() {
<<<<<<< HEAD
  size(500, 500, P2D);
=======
  fullScreen(P2D);
  canvas = createGraphics(width, height);

  canvas.beginDraw();
  canvas.colorMode(HSB);
  canvas.background(0, 255);
  canvas.endDraw();
>>>>>>> Finished

  float ang1 = random(-PI, PI);
  float ang2 = random(-PI, PI);

<<<<<<< HEAD
  dp = new DoublePendulum(ang1, ang2);
  dq = new DoublePendulum(ang1, ang2 + 0.1 * random(1));
=======
  dp = new DoublePendulum(ang1, ang2, 250, 250);
  dq = new DoublePendulum(ang1, ang2 + 0.01 * random(1), 300, 300);
>>>>>>> Finished
}

void draw() {
  image(canvas, 0, 0);
  // Do some logic (implement numerical methods)

  // Euler method
  float h = 1 / iterations;
  for (int i = 0; i < iterations; i++) {

    dp.updateState(rungeKutta4(time, dp, h));
    dq.updateState(rungeKutta4(time, dq, h));
    time += h;
  }

  //// For double pendulum.
  // Get variables
<<<<<<< HEAD
  float x1p = dp.getCartesian()[0];
  float y1p = dp.getCartesian()[1];
  float x2p = dp.getCartesian()[2];
  float y2p = dp.getCartesian()[3];

  float x1q = dq.getCartesian()[0];
  float y1q = dq.getCartesian()[1];
  float x2q = dq.getCartesian()[2];
  float y2q = dq.getCartesian()[3];
  // Draw stuff

  pushMatrix();
  translate(width / 2, height / 2);

  rotate(HALF_PI);

  noFill();
  stroke(0);
  ellipse(0, 0, 10, 10);

  line(0, 0, x1p, y1p);
  line(x1p, y1p, x2p, y2p);
  line(0, 0, x1q, y1q);
  line(x1q, y1q, x2q, y2q);

  noStroke();
  fill(0, 255, 0);
  ellipse(x1p, y1p, 10, 10);
  ellipse(x2p, y2p, 10, 10);

  fill(0, 0, 255);

  ellipse(x1q, y1q, 10, 10);
  ellipse(x2q, y2q, 10, 10);
  popMatrix();

  stroke(0);
  text("  E: " + dp.energy(), 10, height - 55);
  text("E0: " + dp.initial_energy, 10, height - 40);
  text("E%: " + 100 * dp.energy() / dp.initial_energy, 10, height - 25);
  text("e%: " + 100 * (dp.energy() - dp.initial_energy) / dp.initial_energy, 10, height - 10);

  text("  E: " + dq.energy(), 120, height - 55);
  text("E0: " + dq.initial_energy, 120, height - 40);
  text("E%: " + 100 * dq.energy() / dq.initial_energy, 120, height - 25);
  text("e%: " + 100 * (dq.energy() - dq.initial_energy) / dq.initial_energy, 120, height - 10);
=======

  x1p = dp.getCartesian()[0];
  y1p = dp.getCartesian()[1];
  x2pp = x2p;
  y2pp = y2p;
  x2p = dp.getCartesian()[2];
  y2p = dp.getCartesian()[3];

  x1q = dq.getCartesian()[0];
  y1q = dq.getCartesian()[1];
  x2qp = x2q;
  y2qp = y2q;
  x2q = dq.getCartesian()[2];
  y2q = dq.getCartesian()[3];
  // Draw stuff

//  pushMatrix();
//  translate(width / 2, height / 2);

//  rotate(HALF_PI);

//  noFill();
//  stroke(0);
//  ellipse(0, 0, 10, 10);

//  line(0, 0, x1p, y1p);
//  line(x1p, y1p, x2p, y2p);
//  line(0, 0, x1q, y1q);
//  line(x1q, y1q, x2q, y2q);

//  noStroke();
//  fill(0, 255, 0);
//  ellipse(x1p, y1p, 10, 10);
//  ellipse(x2p, y2p, 10, 10);

//  fill(0, 0, 255);

//  ellipse(x1q, y1q, 10, 10);
//  ellipse(x2q, y2q, 10, 10);
//  popMatrix();

  canvas.beginDraw();
  canvas.background(0, 5);
  canvas.translate(width / 2, height / 2);
  canvas.rotate(HALF_PI);
  if (frames > 1) {
    canvas.stroke(frames % 256, 255, 255);
    canvas.strokeWeight(2);
    canvas.line(x2p, y2p, x2q, y2q);
    canvas.stroke(0, 0, 255);
    //canvas.line(x2q, y2q, x2qp, y2qp);
  }
  canvas.endDraw();

//  stroke(0);
//  text("  E: " + dp.energy(), 10, height - 55);
//  text("E0: " + dp.initial_energy, 10, height - 40);
//  text("E%: " + 100 * dp.energy() / dp.initial_energy, 10, height - 25);
//  text("e%: " + 100 * (dp.energy() - dp.initial_energy) / dp.initial_energy, 10, height - 10);

//  text("  E: " + dq.energy(), 120, height - 55);
//  text("E0: " + dq.initial_energy, 120, height - 40);
//  text("E%: " + 100 * dq.energy() / dq.initial_energy, 120, height - 25);
//  text("e%: " + 100 * (dq.energy() - dq.initial_energy) / dq.initial_energy, 120, height - 10);
  frames++;
>>>>>>> Finished
}

void mousePressed() {
  float ang1 = random(-PI, PI);
  float ang2 = random(-PI, PI);

<<<<<<< HEAD
  dp = new DoublePendulum(ang1, ang2);
  dq = new DoublePendulum(ang1, ang2);
=======
  canvas.beginDraw();
  canvas.background(0, 255);
  canvas.endDraw();
  frames = 0;
  dp = new DoublePendulum(ang1, ang2, 250, 250);
  dq = new DoublePendulum(ang1, ang2 + 0.01 * random(1), 300, 300);
>>>>>>> Finished
}

float[] euler(float time, DoublePendulum p, float h) {
  float[] state =  sum(mult(p.equation(time, p.getState()), h), p.getState());
  return state;
}

float[] rungeKutta4(float time, DoublePendulum p, float h) {
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
