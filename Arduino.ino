
int sensorPin = A0;
int sensorPin2 = A2;

int sensorValue;
  
int sensorValue2;


void setup() 
{
Serial.begin(9600);  

}




void loop() 
{
sensorValue = analogRead(sensorPin);
sensorValue2 = analogRead(sensorPin2);  

Serial.print(sensorValue);
Serial.print(",");    // print a comma to separate the values
Serial.println(sensorValue2);

delay(50);
}
