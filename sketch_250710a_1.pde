import processing.serial.*;
Serial myPort;

int angle = 0;
int distance = 0;
int maxRange = 100; // limit to 100 cm

void setup() {
  size(800, 600);
  myPort = new Serial(this, "COM6", 9600);
  myPort.bufferUntil('\n');
  background(0);
  smooth();
}

void draw() {
  background(0);

  // Setup radar center
  translate(width / 2, height);
  stroke(0, 255, 0);
  strokeWeight(2);
  noFill();

  // Draw radar arc
  arc(0, 0, 2 * maxRange, 2 * maxRange, PI, TWO_PI);
  arc(0, 0, 4 * maxRange, 4 * maxRange, PI, TWO_PI);
  arc(0, 0, 6 * maxRange, 6 * maxRange, PI, TWO_PI);

  // Draw angle lines every 30°
  for (int a = 0; a <= 180; a += 30) {
    float x = maxRange * 3 * cos(radians(a));
    float y = -maxRange * 3 * sin(radians(a));
    line(0, 0, x, y);
    textAlign(CENTER);
    fill(0, 255, 0);
    text(a + "°", x, y);
  }

  // Radar sweeping line
  float sweepX = maxRange * 3 * cos(radians(angle));
  float sweepY = -maxRange * 3 * sin(radians(angle));
  stroke(0, 255, 0);
  line(0, 0, sweepX, sweepY);

  // Draw dot if within range
  if (distance > 0 && distance <= maxRange) {
    float dx = distance * 3 * cos(radians(angle));
    float dy = -distance * 3 * sin(radians(angle));
    fill(255, 0, 0);
    noStroke();
    ellipse(dx, dy, 10, 10);

    // Show distance value
    fill(255);
    textAlign(LEFT);
    text(distance + " cm", dx + 8, dy);
  }
}

void serialEvent(Serial p) {
  String data = p.readStringUntil('\n');
  if (data != null) {
    data = trim(data);
    println("Data: " + data);
    String[] parts = split(data, ",");
    if (parts.length == 2) {
      try {
        angle = int(parts[0]);
        distance = int(parts[1]);
        if (distance > maxRange) {
          distance = 0;  // ignore values beyond 100 cm
        }
      } catch (Exception e) {
        println("Parse error: " + data);
      }
    }
  }
}
