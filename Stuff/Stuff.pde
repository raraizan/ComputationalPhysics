Particle[] particles = new Particle[5];
float[] currentState = new float[4];
float[] nextState = new float[4];
float time = 0;

float iterations = 1000;

void setup() {
  size(500, 500, P2D);

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(width), random(height), random(-1, 1), random(-1, 1));
  }
}

void draw() {
  background(0);


  for (Particle p : particles) {
    float h = 1 / iterations; 

    for (int i = 0; i < iterations; i++) {
      for (Particle q : particles) {
        if (p != q) p.applyForce(attraction(p, q)[0], attraction(p, q)[1]);
      }
      nextState = rungeKutta4(time, p, h); 
      p.updateState(nextState); 

      time += h;
    }

    // Get variables
    float x = p.getCartesian()[1]; 
    float y = p.getCartesian()[0]; 
    // Draw stuff

    pushMatrix(); 
    ellipse(x, y, 10, 10); 
    popMatrix();
  }
}

void mousePressed() {
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(width), random(height), random(-1, 1), random(-1, 1));
  }
}

float[] euler(float time, Particle p, float h) {
  float[] state =  sum(mult(p.equation(time, p.getState()), h), p.getState()); 
  return state;
}

float[] rungeKutta4(float time, Particle p, float h) {
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

float[] attraction(Particle p, Particle q) {
  
  float rad = dist(p.x, p.y, q.x, q.y);
  float[] force = {q.x - p.x, q.y - p.y};
  force = mult(force, 10 / (rad * rad));
  return force;
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
