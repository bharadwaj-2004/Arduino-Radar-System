# Arduino Radar System with Processing UI

This project uses an Arduino UNO, HC-SR04 ultrasonic sensor, and a servo motor to simulate a radar system. The data is visualized using a custom radar interface built in Processing.

##  Components Used
- Arduino UNO
- Servo Motor (SG90)
- HC-SR04 Ultrasonic Sensor
- Processing IDE for radar visualization

##  Connections: circuit diagram is given in the repo.

| Component     | Arduino Pin |
|---------------|-------------|
| Servo Signal  | D6          |
| HC-SR04 Trig  | D9          |
| HC-SR04 Echo  | D10         |

##  Folder Structure

- `radar.ino`: Arduino sketch
- `ProcessingRadar/ProcessingRadar.pde`: Processing sketch

## Screenshots

![Radar UI](<img width="1584" height="1236" alt="radar UI" src="https://github.com/user-attachments/assets/bb51b021-5fa3-4399-b4be-7ffc5222f3b0" />
)

##  Output Example
- Red dots show detected obstacles.
- Distance limited to 100 cm.
- Real-time radar sweep.


##  Usage

1. Upload `arduino code` to Arduino using Arduino IDE
2. Run `Processing code` in Processing (make sure Arduino Serial Monitor is closed)
3. COM port must match (e.g., "COM6")

---

##  Future Work
- Add CSV data logging.
- Use real-time graph of distance.
- Add 3D view with PeasyCam.

