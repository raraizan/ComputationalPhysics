Particle p;
float iterations = 1000;

void setup() {
  size(500, 500, P2D);

  p = new Particle(width / 2, 0, 0, 0);
}

void draw() {
  background(0);

  float h = 1 / iterations;

  for (int i = 0; i < iterations; i++) {
    p.applyForce(new PVector(0, 1));
    p.update(h);
  }

  // Draw stuff

  pushMatrix();
  ellipse(p.pos.x, p.pos.y, 10, 10);
  popMatrix();
}
