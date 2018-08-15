import peasy.*;
PeasyCam cam;
ArrayList<PVector> points = new ArrayList<PVector>();

float sigma = 10;
float r = 28;
float b = 8/3;
float x, y, z;
float dt = 0.001;
int rot = 0;
float init_angle;
void setup() {
  fullScreen(P3D);
  x = random(-50, 50);
  y = random(-50, 50);
  z = random(-50, 50);
  cam = new PeasyCam(this, 200);
  colorMode(HSB);
  init_angle = random(0, TWO_PI);
}

void draw() {
  background(0);
  rotateZ(init_angle);
  int hue = rot;
  for (int i = 0; i < 10; i++) {
    float dx = sigma * (y - x);
    float dy = - x * z + r * x - y;
    float dz = x * y - b * z;

    x += dx * dt;
    y += dy * dt;
    z += dz * dt;
  }
  points.add(new PVector(x, y, z));


  noFill();
  strokeWeight(2);

  beginShape();
  for (int i = 0; i < points.size(); i++) {
    PVector point = points.get(i);
    stroke(hue % 255, 255, 255);
    vertex(point.x, point.y, point.z);
    hue += i % 3;
  }
  endShape();

  noStroke();
  fill(255);
  pushMatrix();
  translate(points.get(points.size() - 1).x, points.get(points.size() - 1).y, points.get(points.size() - 1).z);
  sphere(1);
  popMatrix();

  rot ++;
  println(mouseX);
}

void keyPressed() {
  if (key != ' ') return;
  background(0);
  points.clear();
  x = random(-50, 50);
  y = random(-50, 50);
  z = random(-50, 50);
  cam = new PeasyCam(this, 200);
  init_angle = random(0, TWO_PI);
}
