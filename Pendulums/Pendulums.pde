DoublePendulum dp;

void setup() {
  fullScreen(P2D);
  dp = new DoublePendulum();
}

void draw() {
  background(255);



  // Do some logic (implement numerical methods)


















  // For double pendulum.
  // Get variables
  float x1 = dp.getCartesian()[0];
  float y1 = dp.getCartesian()[1];
  float x2 = dp.getCartesian()[2];
  float y2 = dp.getCartesian()[3];

  // Draw stuff
  translate(width / 2, height / 2);

  noFill();
  stroke(0);
  ellipse(0, 0, 10, 10);
  line(0, 0, x1, y1);
  line(x1, y1, x2, y2);
  noStroke();
  fill(0);
  ellipse(x1, y1, 10, 10);
  ellipse(x2, y2, 10, 10);
  
  // For simple pendulum.
  //// Get variables
  //float x = dp.getCartesian()[0];
  //float y = dp.getCartesian()[1];

  //// Draw stuff
  //translate(width / 2, height / 2);

  //noFill();
  //stroke(0);
  //ellipse(0, 0, 10, 10);
  //line(0, 0, x, y);
  //line(0, 0, x, y);
  //noStroke();
  //fill(0);
  //ellipse(x, y, 10, 10);
}

void mousePressed() {
  dp = new DoublePendulum();
}
