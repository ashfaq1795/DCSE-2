from cmath import pi
import math
Redius=int(input("Please enter the redius of an Orbit in Million Km: "))
Velocity=int(input("Please enter the orbital speed in Km/s: "))
duration=(2*pi*Redius)/Velocity
print("The duration of Year in second on planet is: ",duration)