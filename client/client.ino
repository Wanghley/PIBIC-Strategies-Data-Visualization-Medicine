/*
AUTHOR: Wanghley Soares Martins (@wanghley)
DATE: April 11, 2019
CONTACT: wanghleys@gmail.com
REV1: Fabio Henrique, Lissa Ximenes
DATE: Sep 19, 2019
REV2: Wanghley Martins
DATE: Nov 19, 2020
*/
#include <TimerOne.h>       // Library for timer interrupt
#include <MPU6050.h>        // Standard library for manipulation on the MPU6050
#include <Wire.h>           // Control library of the I²C protocol, used by the MPU6050
#include <SoftwareSerial.h> // Bluetooth control library

#define BTN 12
#define LED 7

SoftwareSerial BTSerial(10, 11); // RX | TX

const int MPU = 0x68; // MPU6050 address on the I²C bus (available in datasheet)
volatile bool visualization = false; // Variable is loaded into the "RAM memory" of the microcontroller
boolean controle = true, initiate = false; // Variable of flow control
int ledstate = 0; // LED state indicator
double AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ; // Variables used to store data
char a;
unsigned long current;
unsigned long last;
volatile bool flag = false;
bool flagCopy;
volatile unsigned long interval = 0;
unsigned long intervalCopy;
long Micros;

void setup()
{
    /*Bluetooth comunication: 
      Module - HC-05
      Password - 1234
    */
    Wire.begin();                // I²C communication starts
    Wire.beginTransmission(MPU); // Indicates the address of the MPU to start communication
    Wire.write(0x6B);            // Indicates the MPU that the communication will start
    Wire.write(0);               // Indicates the MPU that wants to leave the communication on standby
    Wire.endTransmission(true);  // Disables communication

    Serial.begin(57600);
    Serial.println("Open Parkinson's Diagnostic Device");
    BTSerial.begin(57600); // HC-05 default speed in AT command more

    // starts the sample rate by time (clock)
    Timer1.initialize(20000); // Adjusted for 50hz = 10⁶ / 50 = 20,000µs
    Timer1.attachInterrupt(changeFlag); // Indicates the function that will be called every 20,000ms
    
    pinMode(BTN,INPUT_PULLUP);
    pinMode(LED,OUTPUT);
    digitalWrite(LED,LOW);
}

//Função que imprime os dados lidos pelo MPU6050 a cada chamada da interrupção
void changeFlag(){
  if (visualization){
    flag = true; // active data display
    Micros = micros();
  }    
}

void loop(){
  if(digitalRead(BTN)==LOW){
   if(initiate==true){
     Serial.println("Finalizando...");
     initiate = false;
     BTSerial.write("stop#");
     digitalWrite(LED,LOW);
   }else{
     Serial.println("initiatendo...");
     initiate=true;
     digitalWrite(LED,HIGH);
   }
   delay(350);
  }
    
  if (initiate){ 
    if(Serial.available()){
     a = Serial.read();
     if(a=='f'){
       BTSerial.write("stop#");
       BTSerial.flush();//Descarrega o buffer
       Serial.println("Comunication Closed!");
       visualization = false;
     }
    }

    noInterrupts();// 
    flagCopy = flag;
    flag = false;
    intervalCopy = interval;
    interval = 0;
    interrupts();
    if (flagCopy){
      printData();
    }
    int val = BTSerial.read();
    
    char carac, carac1;
    if (val != -1){
        carac = val;
    }
    
    if (carac == 's'){
      Serial.println("Comunication started!\nWaiting final handshake");
      BTSerial.write("ok#");
      BTSerial.flush(); //Limpar buffer
      while (controle){
        val = BTSerial.read();
        if (val != -1){
          carac1 = val;
          if(carac1=='c'){
            controle = false;
            Serial.println("Data collection started!");
            visualization = true;
          }
        }
      }
    }
    
    if (visualization){
        Wire.beginTransmission(MPU); //Indica a retomada na comunicação i²c
        Wire.write(0x3B);            /*initiate o registrador do MPU6050, indicando que irá receber dados*/
        Wire.endTransmission(false); //initiate a comunicação estável novamente
        //Solicita dados do sensor
        Wire.requestFrom(MPU, 14, true);
        getData();
        // Keep reading from HC-05 and send to Arduino Serial Monitor
    }

    if (Serial.available()){
      a = Serial.read();
      if (a == 'f'){
        BTSerial.write("stop#");
        BTSerial.flush(); //Descarrega o buffer
        Serial.println("Canal fechado..");
        visualization = false;
      }
    }
  }
}

//Função que recebe os dados do MPU6050 e
//faz as conversões do valor bruto para acc = g e gy = º/seg
void getData(){
  //Armazena o valor dos sensores nas variaveis correspondentes
  AcX = Wire.read() << 8 | Wire.read(); //0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY = Wire.read() << 8 | Wire.read(); //0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcZ = Wire.read() << 8 | Wire.read(); //0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  Tmp = Wire.read() << 8 | Wire.read(); //0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  GyX = Wire.read() << 8 | Wire.read(); //0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  GyY = Wire.read() << 8 | Wire.read(); //0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  GyZ = Wire.read() << 8 | Wire.read(); //0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
  
  
  //Dados recebidos em 2g
  AcX = AcX / 16384.0;        //Conversão para G
  AcY = AcY / 16384.0;        //Conversão para G
  AcZ = AcZ / 16384.0;        //Conversão para G
  Tmp = Tmp / 340.00 + 36.53; //Conversão para ºC
  GyX = GyX / 250.0;          //Conversão para º/seg
  GyY = GyY / 250.0;          //Conversão para º/seg
  GyZ = GyZ / 250.0;          //Conversão para º/seg
}

void printData(){
  BTSerial.print((String)Micros+","+(String)AcX+","+(String)AcY+","+(String)AcZ+","+(String)GyX+","+(String)GyY+","+(String)GyZ+","+(String)Tmp+"#");
  BTSerial.flush();
//  Serial.println((String)Micros+","+(String)AcX+","+(String)AcY+","+(String)AcZ+","+(String)GyX+","+(String)GyY+","+(String)GyZ+","+(String)Tmp+"#");
}
