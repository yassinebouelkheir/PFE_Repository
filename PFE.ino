/**
 * Copyright (c) 2022 Data Logger
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
 * even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program.
 * If not, see <http://www.gnu.org/licenses/>.
*/

 /* 
    ScriptName    : PFE.ino
    Author        : BOUELKHEIR Yassine
    Version       : 3.0
    Created       : 18/03/2022
    License       : GNU General v3.0
    Developers    : BOUELKHEIR Yassine, CHENAFI Soumia
*/

#include <Wire.h>
#include <LiquidCrystal_I2C.h>


#define PACKET_TYPE_SENSOR     (0)
#define PACKET_TYPE_CHARGE     (1)

#define CURRENT_TYPE_DC        (0)
#define CURRENT_TYPE_AC        (1)

#define CHARGE1_RELAY_PIN      (0)
#define CHARGE2_RELAY_PIN      (1)
#define CHARGE3_RELAY_PIN      (2)
#define CHARGE4_RELAY_PIN      (3)
#define CHARGE5_RELAY_PIN      (4)
#define CHARGE6_RELAY_PIN      (5)
#define CHARGE7_RELAY_PIN      (6)
#define CHARGE8_RELAY_PIN      (7)

#define COMMAND1_KEYBOARD_PIN  (8)
#define COMMAND2_KEYBOARD_PIN  (9)
#define COMMAND3_KEYBOARD_PIN  (10)

#define CURRENTDC_SENSOR_PIN   (A0)
#define CURRENTAC_SENSOR_PIN   (A1)
#define VOLTAGEDC_SENSOR_PIN   (A2)
#define TEMP_SENSOR_PIN        (A3)
#define RADIATION_SENSOR_PIN   (A4)
#define HUMIDITY_SENSOR_PIN    (A5)
 
#define LCD_1_I2C_PIN_1        (0) 
#define LCD_1_I2C_PIN_2        (0)
#define LCD_1_I2C_ADDR         (0x3F)
#define LCD_1_TIMEOUT_TIME     (10000) // 10 Seconds

#define LCD_2_I2C_PIN_1        (0) 
#define LCD_2_I2C_PIN_2        (0) 
#define LCD_2_I2C_ADDR         (0x3F)

#define ACS712_CONSTANT_FACTOR (66)
#define ACS758_CONSTANT_OFFSET (2500)
#define VOLTAGEAC_CONSTANT_EFF (230)

int CURRENTAC_SENSOR_SCALE = 40;
float CURRENTDC_SENSOR_ZERO = 0.0;    
float CURRENTAC_SENSOR_ZERO = 0.0;   

int LCD_TIMEOUT_LAST_TIME = 0;
bool LCD_BACKLIGHT_ON = false;
int ACTIVE_PAGE = 0;

LiquidCrystal_I2C LCD1(LCD_1_I2C_ADDR, LCD_1_I2C_PIN_1, LCD_1_I2C_PIN_2);
LiquidCrystal_I2C LCD2(LCD_2_I2C_ADDR, LCD_2_I2C_PIN_1, LCD_2_I2C_PIN_2);

void setup() 
{
	for(int i = 0; i <= 7; i++) pinMode(i, OUTPUT);
	for(int i = 8; i <= 10; i++) pinMode(i, INPUT);

	LCD1.init();   
	LCD1.init();
	LCD1.backlight();
	LCD_TIMEOUT_LAST_TIME = millis();
	LCD_BACKLIGHT_ON = true;

	LCD1.clear();

	LCD2.init();   
	LCD2.init();
	LCD2.backlight();
	LCD2.clear();

	CURRENTDC_SENSOR_ZERO = getCurrent(CURRENT_TYPE_DC);
 	CURRENTAC_SENSOR_ZERO = getCurrent(CURRENT_TYPE_AC);
	Serial.begin(9600);
}

void loop() 
{
	// Capteur de Température 
	float TEMP_SENSOR_VALUE = (analogRead(TEMP_SENSOR_PIN) / 9.31);

	// Capteur d'Humidité 
	float HUMIDITY_SENSOR_VALUE = map(analogRead(HUMIDITY_SENSOR_PIN), 0, 1023, 0, 100);

	// Capteur de Radiation 
	float RADIATION_SENSOR_VALUE = map(analogRead(RADIATION_SENSOR_PIN), 0, 1023, 0, 100);

	// Capteur de Courant DC
	float CURRENTDC_SENSOR_RAW = getCurrent(CURRENT_TYPE_DC);
	float CURRENTDC_SENSOR_VALUE = (float)((CURRENTDC_SENSOR_RAW - CURRENTDC_SENSOR_ZERO)/1024*5)/(ACS712_CONSTANT_FACTOR*100000);

	// Capteur de Courant AC
	float CURRENTAC_SENSOR_RAW = getCurrent(CURRENT_TYPE_AC);
	float CURRENTAC_SENSOR_FILTERED = ((CURRENTAC_SENSOR_RAW-CURRENTAC_SENSOR_ZERO)/1023.0)*5000;
	float CURRENTAC_SENSOR_VALUE = (CURRENTAC_SENSOR_FILTERED - ACS758_CONSTANT_OFFSET)/CURRENTAC_SENSOR_SCALE;

	// Capteur de Tension DC
	float VOLTAGEDC_SENSOR_VALUE = map(analogRead(VOLTAGEDC_SENSOR_PIN), 0, 1023, 0, 25);

	// Communication avec le Raspberry Pi
	if (Serial.available() > 0) 
	{
		getChargeCommand(); // Mise à jour de l'état des charges
		sendValue(PACKET_TYPE_SENSOR, TEMP_SENSOR_PIN, TEMP_SENSOR_VALUE); // Température
		sendValue(PACKET_TYPE_SENSOR, HUMIDITY_SENSOR_PIN, HUMIDITY_SENSOR_VALUE); // Humidité
		sendValue(PACKET_TYPE_SENSOR, RADIATION_SENSOR_PIN, RADIATION_SENSOR_VALUE); // Radiation
		sendValue(PACKET_TYPE_SENSOR, CURRENTDC_SENSOR_PIN, CURRENTDC_SENSOR_VALUE); // Courant DC
		sendValue(PACKET_TYPE_SENSOR, CURRENTAC_SENSOR_PIN, CURRENTAC_SENSOR_VALUE); // Courant AC
		sendValue(PACKET_TYPE_SENSOR, VOLTAGEDC_SENSOR_PIN, VOLTAGEDC_SENSOR_VALUE); // Tension DC
	}

	// Affichage des mesures sur la LCD Principale
	displayResults(TEMP_SENSOR_VALUE, HUMIDITY_SENSOR_VALUE, RADIATION_SENSOR_VALUE, CURRENTDC_SENSOR_VALUE, CURRENTAC_SENSOR_VALUE, VOLTAGEDC_SENSOR_VALUE);

	// Affichage des mesures sur la 2éme LCD
	LCD2.clear();
	LCD2.setCursor(0, 0);
	LCD2.print("TensionDC: " + String((int)VOLTAGEDC_SENSOR_VALUE) + " V");
	LCD2.setCursor(0, 1);
	LCD2.print("CurrentDC: " + String(CURRENTDC_SENSOR_VALUE, 2) + " A");

	// LCD Backlight Timeout
	if(LCD_1_TIMEOUT_TIME >= (milis() - LCD_TIMEOUT_LAST_TIME))
	{
		if(LCD_BACKLIGHT_ON) 
		{
			LCD1.noBacklight();
			LCD_BACKLIGHT_ON = false;
		}
	}
	delay(100);
}

void activePageUpdate(int pin)
{
	if(digitalRead(COMMAND1_KEYBOARD_PIN))
	{
		if(ACTIVE_PAGE < 2) ACTIVE_PAGE += 1;
		else ACTIVE_PAGE = 2;
	}
	else if(digitalRead(COMMAND2_KEYBOARD_PIN))
	{
		if(!LCD_BACKLIGHT_ON) 
		{
			LCD1.backlight();
			LCD_TIMEOUT_LAST_TIME = millis();
			LCD_BACKLIGHT_ON = true;
		}
		else 
		{
			LCD1.noBacklight();
			LCD_BACKLIGHT_ON = false;
		}

	}
	else if(digitalRead(COMMAND3_KEYBOARD_PIN))
	{
		if(ACTIVE_PAGE > 0) ACTIVE_PAGE -= 1;
		else ACTIVE_PAGE = 0;
	}
}

void displayResults(float temp, float humidity, float radiation, float currentdc, float currentac, float voltagedc)
{
	switch(ACTIVE_PAGE)
	{
		case 0:
		{
			LCD1.clear();
			LCD1.setCursor(0, 0);
			LCD1.print("     Environment    ");
			LCD1.setCursor(0, 1);
			LCD1.print("Temperature: " + String((int)temp) + " °C");
			LCD1.setCursor(0, 2);
			LCD1.print("Humidity: " + String((int)humidity) + " %");
			LCD1.setCursor(0, 3);
			LCD1.print("Radiation: " + String((int)radiation) + " %");
			break;
		}
		case 1:
		{
			LCD1.clear();
			LCD1.setCursor(0, 0);
			LCD1.print("     Energy  AC     ");
			LCD1.setCursor(0, 1);
			LCD1.print("Voltage AC: "+ VOLTAGEAC_CONSTANT_EFF +" V");
			LCD1.setCursor(0, 2);
			LCD1.print("Current AC: " + String(currentac, 2) + " A");
			LCD1.setCursor(0, 3);
			LCD1.print("Puissance AC: " + String((VOLTAGEAC_CONSTANT_EFF*currentac)) + " W");
			break;
		}
		case 2:
		{
			LCD1.clear();
			LCD1.setCursor(0, 0);
			LCD1.print("     Energy  DC     ");
			LCD1.setCursor(0, 1);
			LCD1.print("Voltage DC: "+ String(voltagedc, 1) +" V");
			LCD1.setCursor(0, 2);
			LCD1.print("Current DC: " + String(currentdc, 2) + " A");
			LCD1.setCursor(0, 3);
			LCD1.print("Puissance DC: " + String((voltagedc*currentdc)) + " W");
			break;
		}
		default: 
		{
			Serial.print("Error: Select page is invalid. (Page: "+ String(ACTIVE_PAGE) +" )");
			break;
		}
	}
}

void sendValue(int packettype, int packetid, float value)
{
	if (Serial.available() > 0) 
  	{
  		if(packettype == PACKET_TYPE_SENSOR) 
  		{
  			if(value > 255) Serial.print("Error: Sensor ID "+ String(packetid) +" Value cannot be greater than 255.\n");
  			else if(value < -255) Serial.print("Error: Sensor ID "+ String(packetid) +" Value cannot be lower than -255.\n");
  			else Serial.print("setsensor " + String(packetid) + " " + String(value));
  		}
  		else 
  		{
  			if(packetid > 7) Serial.print("Error: Charge ID cannot be greater than 7.\n");
  			else if(packetid < 0) Serial.print("Error: Charge ID cannot be lower than 0.\n");
  			else if((int)value > 1) Serial.print("Error: Charge ID "+ String(packetid) +" Value cannot be greater than 1.\n");
  			else if((int)value < 0) Serial.print("Error: Charge ID "+ String(packetid) +" Value cannot be lower than 0.\n");
  			else Serial.print("setcharge " + String(packetid) + " " + String((int)value));
  		}
	}
}

void getChargeCommand()
{
	if (Serial.available() > 0) 
  	{
		String data = Serial.readStringUntil('\n');
    	Serial.println(data);
    	if (data.length()>1)
    	{
    		int id, value;
	        char Buf[30];
	        data.toCharArray(Buf, 30);
    		sscanf(Buf, "setcharge %d %d", id, value);
    		
    		if(id > 7) Serial.print("Error: Charge ID cannot be greater than 7.\n");
  			else if(id < 0) Serial.print("Error: Charge ID cannot be lower than 0.\n");
  			else if(value > 1) Serial.print("Error: Charge ID "+ String(id) +" Value cannot be greater than 1.\n");
  			else if(value < 0) Serial.print("Error: Charge ID "+ String(id) +" Value cannot be lower than 0.\n");
    		else digitalWrite(id, (bool)value);
        }
	}
}

float getCurrent(int current_sensor_type)
{
	int CURRENT_SENSOR_RAW;
	float CURRENT_SENSOR_AVERAGE = 0;

	for( int i = 0; i < 50; i++ )
	{
		if(current_sensor_type == CURRENT_TYPE_DC) CURRENT_SENSOR_RAW = analogRead(CURRENTDC_SENSOR_PIN);
		else CURRENT_SENSOR_RAW = analogRead(CURRENTAC_SENSOR_PIN);
		CURRENT_SENSOR_AVERAGE += float(valeur);
	}
	CURRENT_SENSOR_RAW /= 50.0;
	return CURRENT_SENSOR_RAW;
}