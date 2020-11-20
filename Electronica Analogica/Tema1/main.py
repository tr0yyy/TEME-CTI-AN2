# In[1]:
from matplotlib import pyplot as plt
import numpy as np


# In[2]:

U = np.array([4.85, 4.95, 4.96, 2.58], dtype = float)
I = np.array([950.98, 183.33, 99.2, 1.29], dtype = float)
I = I / 1000

print(U)
print(I)

index = range(len(I))

plt.figure()

plt.plot(I,U,'o--')
plt.title("Tabelul 1")
plt.xlabel("Intensitatea I (A)")
plt.ylabel("Tensiunea U (V)")

plt.grid()
plt.show()

# In[3]:
U2 = np.array([1.32, 1.6, 1.79, 1.88, 1.95], dtype = float)
I2 = np.array([1.76, 1.07, 0.59, 0.4, 0.19], dtype = float)
I2 = I2 / 1000

plt.figure()

plt.plot(I2,U2,'o--')
plt.title("Tabelul 2")
plt.xlabel("Intensitatea I (A)")
plt.ylabel("Tensiunea U (V)")

plt.grid()
plt.show()

# In[4]:
U3 = np.array([3.88, 7.71, 12.14, 13.4, 14.93], dtype = float)
I3 = np.array([5.17, 5.14, 4.05, 2.85, 1.49], dtype = float)
I3 = I3 / 1000

plt.figure()

plt.plot(U3,I3,'o--')
plt.title("Tabelul 3")
plt.xlabel("Tensiunea U (V)")
plt.ylabel("Intensitatea I (A)")

plt.grid()
plt.show()