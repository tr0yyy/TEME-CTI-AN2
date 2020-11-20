from matplotlib import pyplot as plt
import numpy as np

u = np.linspace(-1,1,11)
T = np.array([-0.8, 3.2, 7.3, 13.1, 20.6, 25.4, 36.8, 47.4, 56.7, 64.5, 71.3], dtype = float)

plt.figure()

plt.plot(u,T,'o--')
plt.title("T = f(u)")
plt.xlabel("u")
plt.ylabel("T (grade Celsius)")

plt.grid()
plt.show()


R = np.array([26.9, 22.7, 19.2, 15.4, 11.7, 9.8, 6.7, 4.8, 3.6, 2.9, 2.4], dtype = float)

plt.figure()

plt.plot(T,R,'o--')
plt.title("R = f(T)")
plt.xlabel("T (grade Celsius)")
plt.ylabel("R (kilo-Ohmi)")

plt.grid()
plt.show()
