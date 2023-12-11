#!/usr/bin/python3
# reads serial input from pico
import serial

#ser = serial.Serial('/dev/ttyACM1')
ser = serial.Serial('/dev/ttyACM0', 115200, 8, 'N', 1, timeout = 5)
ser.write(b'\x03')
ser.write(b'\x04')

while True:
    line = ser.readline()
    if line:
        print(line.decode())