
/*
AUTHOR: Wanghley Martins
DATE: March 1, 2020
CONTACT: wanghleys@gmail.com
*/
#include <TimerOne.h> //Biblioteca usada para interrupção por timer
#include <MPU6050.h> //Biblioteca padrão para manipulação na MPU6050
#include <Wire.h> //Biblioteca de controle do protocolo I²C, usado pelo MPU6050
#include <SoftwareSerial.h> //Biblioteca de controle bluetooth

#define BTN 12
#define LED 7

SoftwareSerial BTSerial(10, 11); // RX | TX

const int MPU = 0x68; //endereço do MPU6050 no barramento I²C(disponivel no datasheet)
boolean starte = false,controle=true,inicia=false;
int ledstate=0;
double AcX,AcY,AcZ,Tmp,GyX,GyY,GyZ; // Variaveis usadas para armazenar os dados
char a;
char msg[128];

void setup()
{
  /*Comunicação bluetooth:
  Módulo - HC-05
  Senha - 1234
  */
  Wire.begin(); // Inicia a comunicação I²C
  Wire.beginTransmission(MPU); //Indica o endereço da MPU pq iniciar a comunicação
  Wire.write(0x6B); //Indica a MPU que a comunicação irá iniciar
  Wire.write(0); //Indica a MPU que quer deixar a comunicação em standby
  Wire.endTransmission(true); // Desabilita a comunicação

  Serial.begin(9600);
  Serial.println("Monitoramento Parkinson FABIN 2019!");
  BTSerial.begin(57600);  // HC-05 default speed in AT command more

  //inicia a taxa de amostragem por tempo(clock)
  Timer1.initialize(20000);//Ajustado para 50hz = 10⁶/50 = 20.000µs
  //Timer1.pwm(9,512);
  Timer1.attachInterrupt(printData); // Indica a função que será chamada a cada 20.000ms

  /*Sequência de dados: millis()[unsigned long] >>
  aX=[float]g\taY=[float]g\taZ=[float]g\t
  gX=[float]º/s\tgY=[float]º/s\t
  gZ=[float]º/s\tTmp=[float]ºC\n*
  Sendo float = 4 Bytes, Cada caractere(simples presente na ASCII em UTF-8) = 1 byte,
  unsigned long = 4 Bytes

  Total de floats = 7, Total de unsigned longs = 1, caracteres = 46
  Logo, 7*4 + 4 + 46 = 50+28 = 78 Bytes = 78*8 bits = 624 bits por cada linha
  em 50Hz, tem-se que 624*50 = 31200 bauds (31200 bits/seg)
  */
  pinMode(BTN,INPUT_PULLUP);
  pinMode(LED,OUTPUT);
  digitalWrite(LED,LOW);
}

//Função que imprime os dados lidos pelo MPU6050 a cada chamada da interrupção
void printData(){
  if(starte){
    long milis = millis();
    BTSerial.print(((String)milis+','+AcX+','+AcY+','+AcZ+','+GyX+','+GyY+','+GyZ+','+Tmp+"#")); //padrão de dados a ser enviado
    BTSerial.flush(); //envia tudo e libera o buffer do módulo HC-05
  }
}

void loop()
{
  char carac,carac1;

  if(digitalRead(BTN)==LOW){
    if(inicia==true){
      BTSerial.flush();
      delay(1000);
      Serial.println("Finalizando...");
      BTSerial.write("Finalizando...\n");
      inicia = false;
      starte = false;
      controle = true;
      carac = 'x';
      carac1='x';
      BTSerial.flush();//Descarrega o buffer
      BTSerial.write("sudoStop#\n");
      BTSerial.write("FINALIZADO!\n");
      BTSerial.flush();//Descarrega o buffer
      digitalWrite(LED,LOW);
    }else{
      Serial.println("Iniciando...");
      BTSerial.write("iniciando...\n");
      BTSerial.write("INICIADO!\n");
      inicia=true;
      digitalWrite(LED,HIGH);
    }
    delay(350);
  }

  if(inicia){
    if(Serial.available()){
    a = Serial.read();
    if(a=='f'){
      BTSerial.write("stop#");
      BTSerial.flush();//Descarrega o buffer
      Serial.println("Canal fechado..");
      starte = false;
      digitalWrite(LED,LOW);
    }
  }
  //controle da comunicação arduino -> raspberry pi
  int val = BTSerial.read();
  if(val!=-1){
    carac = val;
    Serial.println(carac);
  }
  if(carac=='s'){
    Serial.println("Enviando dados..");
    BTSerial.write("ok#\n");
    BTSerial.flush();//Limpar buffer

    do{
      val = BTSerial.read();
      if(val!=-1){
        carac1 = val;
        if(carac1=='c'){
          controle=false;
          Serial.println(val);
        }else{
          BTSerial.write("Invalid code!");
          BTSerial.flush();//Limpar buffer
        }
      }
    }while(controle);

    if(carac == 'c' || carac1=='c'){
      Serial.println("Comunicação estabelecida com sucesso!");
      starte = true;
    }
  }
  Wire.beginTransmission(MPU); //Indica a retomada na comunicação i²c
  Wire.write(0x3B);/*Inicia o registrador do MPU6050, indicando que irá receber dados*/
  Wire.endTransmission(false); //Inicia a comunicação estável novamente
  //Solicita dados do sensor
  Wire.requestFrom(MPU,14,true);
  getData();
  blink_send_data();
  // Keep reading from HC-05 and send to Arduino Serial Monitor
  }
}
void blink_send_data(){
  if(starte){
    digitalWrite(LED,HIGH);
    delay(100);
    digitalWrite(LED,LOW);
    delay(100);
  }
}

//Função que recebe os dados do MPU6050 e
//faz as conversões do valor bruto para acc = g e gy = º/seg
void getData(){

  //Armazena o valor dos sensores nas variaveis correspondentes
  AcX=Wire.read()<<8|Wire.read();//0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY=Wire.read()<<8|Wire.read(); //0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcZ=Wire.read()<<8|Wire.read(); //0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  Tmp=Wire.read()<<8|Wire.read(); //0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  GyX=Wire.read()<<8|Wire.read(); //0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  GyY=Wire.read()<<8|Wire.read(); //0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  GyZ=Wire.read()<<8|Wire.read(); //0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)

  //Dados recebidos em 2g
  AcX = AcX/16384.0; //Conversão para G
  AcY = AcY/16384.0; //Conversão para G
  AcZ = AcZ/16384.0; //Conversão para G
  Tmp = Tmp/340.00+36.53; //Conversão para ºC
  GyX=GyX/250.0; //Conversão para º/seg
  GyY=GyY/250.0; //Conversão para º/seg
  GyZ=GyZ/250.0; //Conversão para º/seg
}
