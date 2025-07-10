#include <Servo.h>

const int trigPin = 9;
const int echoPin = 10;
const int servoPin = 6;

Servo servo;
long duration;
int distance;

void setup() {
  Serial.begin(9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  servo.attach(servoPin);
}

void loop() {
  for (int angle = 0; angle <= 180; angle += 3) {
    servo.write(angle);
    delay(100);
    distance = getDistance();
    Serial.print(angle);
    Serial.print(",");
    Serial.println(distance);
  }

  for (int angle = 180; angle >= 0; angle -= 3) {
    servo.write(angle);
    delay(100);
    distance = getDistance();
    Serial.print(angle);
    Serial.print(",");
    Serial.println(distance);
  }
}

int getDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  return duration * 0.034 / 2; // convert to cm
}

