
from matplotlib import pyplot as plt
import numpy as np

I1 = np.array([0.5, 1, 1.6, 3.3], dtype = float)
U1 = np.array([0.62, 0.64, 0.65, 0.67], dtype = float)

plt.figure()

plt.plot(U1,I1,'o--')

plt.xlabel("Tensiunea (V)")
plt.ylabel("Intensitatea (mA)")

I2 = np.array([0.5, 0.9, 2.6, 3.5, 4.3, 5.6], dtype = float)
U2 = np.array([0.2, 0.22, 0.27, 0.28, 0.29, 0.3], dtype = float)

plt.plot(U2,I2,'o--')


I3 = np.array([0, 0.04, 0.48, 0.64, 0.72, 0.97, 1.7, 3.8], dtype = float)
U3 = np.array([0.55, 1.5, 1.68, 1.7, 1.71, 1.73, 1.77, 1.84], dtype = float)

plt.plot(U3,I3,'o--')
plt.legend(['Intensitatea pe dioda de siliciu','Intensitatea pe dioda de germaniu','Intensitatea pe LED'])


plt.grid()
plt.show()


I4 = np.array([0, -0.02, -0.08, -0.36, -0.62, -0.76], dtype = float)
U4 = np.array([-8.8, -8.81, -8.84, -8.88, -8.91, -8.92], dtype = float)

plt.figure()

plt.plot(U4,I4,'o--')
plt.xlabel("Tensiunea (V)")
plt.ylabel("Intensitatea (mA)")
plt.title('Dioda Zener')
plt.grid()
plt.show()


