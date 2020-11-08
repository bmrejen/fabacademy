---
layout: page
title: 12. Output devices
parent: Assignments
nav_order: 11
---

## LCD screen

We are going to connect the LCD screen that came with our Arduino. There are 12 connections to be made!

![alt text]({{site.baseurl}}/assets/images/12-output/01-lcd-fritz.png "lcd fritzing")

We write our code:

```
#include <LiquidCrystal.h>
int rs=7;
int en=8;
int d4=9;
int d5=10;
int d6=11;
int d7=12;
bool firstTime = true;

LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

void setup() {
  lcd.begin(16, 2);   // 16 col, 2 rows
  

}

void loop() {
  lcd.setCursor(0,0);
  
  if (firstTime == true) {
    lcd.print("LCD WORKING!");
    delay(2000);
    lcd.clear();
    firstTime = false;
    } 

  lcd.print("Let's count!");
  delay(1000);

  for (int i=1; i<=10; i++) {
  lcd.setCursor(0,1);
  lcd.print(i);    
      delay(500);
      }
  lcd.clear();
}
```

And it works:

<iframe width="420" height="315" src="https://www.youtube.com/embed/qNa8QM4a8vU" frameborder="0" allowfullscreen></iframe>

## Piezo motor

We will connect a Piezo motor with a joystick.

The joystick is basically 2 potentiometers in parallel - one for X and one for Y. In this project, we will only use the X one but pretend we also use the Y one as a proof of concept.

The X and Y pins will be connected to analog inputs on the Arduino. The switch pin is the button pin - the joypad can also act as a button. Since it returns a boolean value, we will connect it to a digital input.

We will also make a pull-up resistor the software way by writing `digitalWrite(switchPin, HIGH);`

Once the connections are made, we can write our code:

```
#include <Servo.h>

Servo servo;

int Xpin=A0;
int Ypin=A1;
int switchPin=2;
int Xval;
int Yval;
int switchVal;
int servoPin = 7;
float angle;

void setup() {
  Serial.begin(9600);
  pinMode(Xpin, INPUT);
  pinMode(Ypin, INPUT);
  pinMode(switchPin, INPUT);
  digitalWrite(switchPin, HIGH); // to make a pull-up resistor
  servo.attach(servoPin);

}

void loop() {

 // read the joystick movement 
 Xval=analogRead(Xpin);
 Yval=analogRead(Ypin);
 switchVal=digitalRead(switchPin);
 delay(200);

 // print the values
 Serial.print(" X = ");
 Serial.print(Xval);
 Serial.print(" Y = ");
 Serial.print(Yval);
 Serial.print(" Switch= ");
 Serial.println(switchVal);

 // move the servo
 angle = Xval /1023.*180.;
 servo.write(angle);
 Serial.println(angle);
}
```


Now it works. 

<iframe width="420" height="315" src="https://www.youtube.com/embed/OwNQE0kF_Mg" frameborder="0" allowfullscreen></iframe>


The only problem is that I used a continuous Servo, so it never stops. And it interprets the number I send it as a speed, not a direction.

## LCD calculator

Let's use the LCD to make a calculator. The program will ask for a number, a second number, an operator (+ - * or /). The user can enter this data from the Serial Monitor on the Arduino IDE. 

Let's use the same connections and rewrite our code:

```
#include <LiquidCrystal.h>
int rs = 7;
int en = 8;
int d4 = 9;
int d5 = 10;
int d6 = 11;
int d7 = 12;

float firstNum;
float secondNum;
float answer;
String op;

LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

void setup() {
  lcd.begin(16, 2);   // 16 col, 2 rows
  Serial.begin(9600);
}

void loop() {
  // Ask for first number
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Type 1st number");
  while (Serial.available() == 0) {}
  firstNum = Serial.parseFloat();
  while (Serial.available() > 0) {
    Serial.read();
  }

  // Ask for second number
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Type 2nd number");
  while (Serial.available() == 0) {}
  secondNum = Serial.parseFloat();
  while (Serial.available() > 0) {
    Serial.read();
  }

  // Ask for operator
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Choose -+/*");
  while (Serial.available() == 0) {}
  op = Serial.readString()[0];
  while (Serial.available() > 0) {
    Serial.read();
  }

  // Choose operator
  if (op == "+") {
    answer = firstNum + secondNum;
  }
  if (op == "-") {
    answer = firstNum - secondNum;
  }
  if (op == "*") {
    answer = firstNum * secondNum;
  }
  if (op == "/") {
    answer = firstNum / secondNum;
  }

  // Clear screen
  lcd.clear();
  lcd.setCursor(0, 0);

  // Print answer
  lcd.print(firstNum);
  lcd.print(op);
  lcd.print(secondNum);
  lcd.print(" = ");
  lcd.print(answer);

  delay(3000);
}
```

**A few problems we had**
We had a few issues: when writing `if (op == "+") {` we should be careful to use **double quotes** and not single quotes

Also, the serial monitor was sending a carriage return after each line, which created a strange bug: a weird symbol appeared and the processor would always return 0.

The solution was to remove the "Line ending" that the serial monitor would send with every input

![alt text]({{site.baseurl}}/assets/images/12-output/02-ide-line-ending.png "line ending in IDE")

But in the end it works!

<iframe width="420" height="315" src="https://www.youtube.com/embed/OGtp4QKRhlE" frameborder="0" allowfullscreen></iframe>