/**
   Copyright (c) 2022 Data Logger

   This program is free software: you can redistribute it and/or modify it under the terms of the
   GNU General Public License as published by the Free Software Foundation, either version 3 of the
   License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
   even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License along with this program.
   If not, see <http://www.gnu.org/licenses/>.
*/

/*
   ScriptName    : Arduino_Smarthouse_Center.ino
   Author        : BOUELKHEIR Yassine
   Version       : 2.0
   Created       : 01/06/2022
   License       : GNU General v3.0
   Developers    : BOUELKHEIR Yassine
*/

#include <SPI.h>
#include <DHT.h>
#include <DHT_U.h>
#include <nRF24L01.h>
#include <printf.h>
#include <RF24.h>
#include <RF24_config.h>

#define DHTTYPE DHT11

RF24 radio(9, 10);       
const byte address1[6] = "63257";
const byte address2[6] = "57369";

DHT dhtext(2, DHTTYPE);
DHT dhtint(3, DHTTYPE);

bool cO2LevelHigh = false;

void setup() 
{
   radio.begin();

   radio.openReadingPipe(1, address2);
   radio.openWritingPipe(address1);
   radio.disableAckPayload();

   radio.setPALevel(RF24_PA_MAX); 
   radio.stopListening(); 
}

void loop() 
{
   radio.startListening();
   delay(15);

   if(radio.available())
   {
      char text[32];
      radio.read(&text, sizeof(text));
      Serial.println(text);
   }

   radio.stopListening();
   delay(15);

   char data[2];
   data = "00";

   float tempext = dhtext.readTemperature();
   float tempint = dhtint.readTemperature();
   float humidityint = dhtint.readhumidity();

   if(tempint > 24)
   {
      if(tempext < 24)
      {
         if(humidityint < 60) // FAN
         {
            Serial.println("setsensor 20 1");
            Serial.println("setsensor 21 0");
            Serial.println("setsensor 22 1");
            data = "01";
            // OPEN WINDOW
         }
         else 
         {
            Serial.println("setsensor 20 1");
            Serial.println("setsensor 21 0");
            Serial.println("setsensor 22 0");
            data = "00"; 
            // OPEN WINDOW
         }
      }
      else
      {
         if(humidityint < 60) 
         {
            Serial.println("setsensor 20 0");
            Serial.println("setsensor 21 1");
            Serial.println("setsensor 22 1");
            data = "11"; // FAN & AC 
            if(!cO2LevelHigh) // CLOSE WINDOW
         }
         else 
         {
            Serial.println("setsensor 20 0");
            Serial.println("setsensor 21 1");
            Serial.println("setsensor 22 0");
            data = "10"; // AC
            if(!cO2LevelHigh) // CLOSE WINDOW   
         }    
      }
   }
   else
   {
      if(humidityint < 60) 
      {
         Serial.println("setsensor 20 0");
         Serial.println("setsensor 21 0");
         Serial.println("setsensor 22 1");
         data = "01"; // FAN
         if(!cO2LevelHigh) // CLOSE WINDOW
      }
      else 
      {
         Serial.println("setsensor 20 0");
         Serial.println("setsensor 21 0");
         Serial.println("setsensor 22 0");
         data = "00"; // NOTHING
          if(!cO2LevelHigh) // CLOSE WINDOW
      }
   }
   if(data.toInt() != 00) radio.write(&data, sizeof(data));   

   if((1023 - analogRead(A0)) < 500)
   {
      digitalWrite(2, HIGH);
      Serial.println("setsensor 18 1");
   }
   else 
   {
      digitalWrite(2, LOW);   
      Serial.println("setsensor 18 0"); 
   }              
}