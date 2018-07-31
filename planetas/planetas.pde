
PVector pos1, pos2;
PVector vel1, vel2;
float dt = 1;
float m1 = 1, m2 = 2;

void setup() {
  size(500, 500);
  pos1 = new PVector(width / 2, height / 2 + 150);
  pos2 = new PVector(width / 2, height / 2 - 100);
  vel1 = new PVector(1, 0);
  vel2 = new PVector(-1, 0);
  background(0);
}

void draw() {

  PVector acc1 = force(pos1, pos2).div(m1);
  PVector acc2 = force(pos2, pos1).div(m2);

  vel1 = vel1.add(acc1.mult(dt));
  pos1 = pos1.add(vel1.mult(dt).add(acc1.mult(0.5 * dt * dt)));

  vel2 = vel2.add(acc2.mult(dt));
  pos2 = pos2.add(vel2.mult(dt).add(acc2.mult(0.5 * dt * dt)));
  
  PVector centroDeMasa = PVector.add(pos1, pos2).mult(0.5);
  
  translate(width / 2 - centroDeMasa.x, height / 2 - centroDeMasa.y);
  noStroke();
  fill(#00ff00);
  ellipse(pos1.x, pos1.y, 5, 5);
  fill(#0000ff);
  ellipse(pos2.x, pos2.y, 5, 5);
  fill(#00ffff);
  ellipse(centroDeMasa.x, centroDeMasa.y, 4, 4);
}

PVector force(PVector pos1, PVector pos2) {
  float distSq = PVector.sub(pos1, pos2).magSq();
  float mag = 1000 / distSq;
  PVector res = PVector.sub(pos2, pos1).setMag(mag);
  return res;
}

void mouseClicked() {
 background(0); 
}
