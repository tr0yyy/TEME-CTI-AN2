from matplotlib import pyplot as plt
import numpy as np

Vin1 = np.array([4.2, 3.89, 3.5, 2.89, 2.37, 1.72, 0.88, 0.5, 0.093, -0.2, -0.41, -0.89, -1.41, -2.89, -3.55, -4.15], dtype = float)
Vout1 = np.array([-7.12, -7.13, -7.14, -7.16, -7.16, -7.18, -4.5, -2.69, -0.47, 1.05, 2.08, 4.53, 7.17, 8.39, 8.38, 8.12], dtype = float)

plt.figure()

plt.plot(Vin1,Vout1,'o--')
plt.title("Amplificator operator inversor - 10V")
plt.xlabel("Tensiune intrare (V)")
plt.ylabel("Tensiune iesire (V)")

plt.grid()
plt.show()

Vin2 = np.array([6.4, 6.11, 5.66, 4.59, 3.75, 2.79, 1.43, 0.61, 0.25, -0.41, -0.39, -0.78, -1.23, -2, -3.51, -4.53, -5.56, -6.56], dtype = float)
Vout2 = np.array([-11.84, -11.85, -11.86, -11.88, -11.9, -11.92, -7.28, -3.13, -1.3, 0.5, 1.88, 4.18, 6.3, 10.2, 13.17, 13.15, 13.12, 13.1], dtype = float)

plt.figure()

plt.plot(Vin2,Vout2,'o--')
plt.title("Amplificator operator inversor - 15V")
plt.xlabel("Tensiune intrare (V)")
plt.ylabel("Tensiune iesire (V)")

plt.grid()
plt.show()

Vin3 = np.array([-2.43, -2.3, -2.1, -1.76, -1.54, -1.44, -1.09, -0.81, -0.49, 0.1, 0.3, 0.81, 1.14, 1.61, 2.1, 2.47, 2.72, 2.96], dtype = float)
Vout3 = np.array([-7.22, -7.22, -7.22, -7.22, -7.22, -7.21, -7.19, -5.8, -3.19, 0.7, 2.11, 5.64, 7.92, 8.56, 8.56, 8.56, 8.56, 8.56], dtype = float)

plt.figure()

plt.plot(Vin3,Vout3,'o--')
plt.title("Amplificator operator neinversor - 10V")
plt.xlabel("Tensiune intrare (V)")
plt.ylabel("Tensiune iesire (V)")

plt.grid()
plt.show()

Vin4 = np.array([ -4.43, -3.75, -3.21, -2.41, -0.93, 0.26, 1.08, 1.93, 2.67, 3.38, 4.2, 4.33 ,4.53], dtype = float)
Vout4 = np.array([-10.36,- 12.08, -12.08, -12.08, -6.44, 2.03, 7.45, 13.49, 13.49, 13.49, 13.49, 13.49, 13.49], dtype = float)

plt.figure()

plt.plot(Vin4,Vout4,'o--')
plt.title("Amplificator operator neinversor - 15V")
plt.xlabel("Tensiune intrare (V)")
plt.ylabel("Tensiune iesire (V)")

plt.grid()
plt.show()
