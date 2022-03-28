##
 # Copyright (c) 2022 Data Logger
 #
 # This program is free software: you can redistribute it and/or modify it under the terms of the
 # GNU General Public License as published by the Free Software Foundation, either version 3 of the
 # License, or (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
 # even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 # General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License along with this program.
 # If not, see <http://www.gnu.org/licenses/>.
##

## 
#    ScriptName    : PFE.py
#    Author        : BOUELKHEIR Yassine
#    Version       : 3.0
#    Created       : 18/03/2022
#    License       : GNU General v3.0
#    Developers    : BOUELKHEIR Yassine, CHENAFI Soumia
##

import mysql.connector
import serial
import time
import threading
import os

db = mysql.connector.connect(host="localhost", user="adminpi", password="adminpi", database='PFE') 

def receiverHandler():
	print('Running. Press CTRL-C to exit.')
	with serial.Serial("/dev/ttyUSB0", 9600, timeout=1) as arduino:
		time.sleep(0.1) #wait for serial to open
		if arduino.isOpen():
			print("{} connected!".format(arduino.port))
			try:
				while True:
					arduino.write(str.encode(' '))
					while arduino.inWaiting()==0: pass
					if  arduino.inWaiting()>0: 
						answer=arduino.readline()
						decodedanswer = answer.decode().replace('\n', '')
						print("R: " + decodedanswer)
						time.sleep(0.5)
						datasplitted = decodedanswer.split(' ')
						
						if datasplitted[0] == 'setsensor':
							cursor = db.cursor(buffered=True)
							cursor.execute("SELECT * FROM `SENSORS` WHERE ID = " + str(datasplitted[1]))
							time.sleep(0.05)
							rcount = cursor.rowcount
							if rcount > 9:
								cursor = db.cursor(buffered=True)
								sql = "DELETE FROM SENSORS WHERE ID = "+ str(datasplitted[1]) + " ORDER BY UNIXDATE ASC LIMIT " + str(rcount-9) 
								cursor.execute(sql)
								db.commit()
								
							cursor = db.cursor(buffered=True)
							sql = "INSERT INTO `SENSORS` (ID, VALUE, UNIXDATE) VALUES ('"+ str(datasplitted[1]) +"', '" + str(datasplitted[2]) +"', " + str(time.time()) + ")"
							cursor.execute(sql)
							db.commit()
							time.sleep(0.05)
							
						elif datasplitted[0] == 'setcharge':
								cursor = db.cursor(buffered=True)
								sql = "UPDATE CHARGES SET VALUE = '"+ str(datasplitted[2]) +"' WHERE ID = '" + str(datasplitted[1]) +"'"
								cursor.execute(sql)
								db.commit()
							
						time.sleep(0.5)
			except KeyboardInterrupt:
				print("KeyboardInterrupt has been caught.")
			
def broadcastHandler():
	while True:
		cursor = db.cursor()
		cursor.execute("SELECT * FROM `CHARGES` ORDER BY `ID` ASC")
		result = cursor.fetchall()
		for row in result:
			arduino_serial.write(str.encode("setcharge " + str(row[0]) + " " +  str(row[1]) + "\n"));
			print("R: setcharge " + str(row[0]) + " " +  str(row[1]) + "\n");
		
		time.sleep(0.8)

if __name__ == "__main__":
	
	reciever = threading.Thread(target=receiverHandler)
	#broadcast = threading.Thread(target=broadcastHandler)
	
	print("Reciever handler is starting....");
	reciever.start()
	print("Reciever: OK");
	print("Broadcast handler is starting...");
	#broadcast.start()
	print("Broadcast: OK");
	print("Data Logger v1.0 python script - PFE 2021/2022");
	reciever.join()
	#broadcast.join()
