from matplotlib import pyplot as plt
import numpy as np

u = np.linspace(-1,1,11)
T = np.array([-0.8, 3.2, 7.3, 13.1, 20.6, 25.4, 36.8, 47.4, 56.7, 64.5, 71.3], dtype = float)

def realizaregrafic(titlu, xlabel, ylabel, ox, oy):
    plt.figure()
    plt.plot(ox,oy,'o--')
    plt.title(titlu)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.grid()
    plt.show()

realizaregrafic("T = f(u)", "u", "T (grade Celsius)", u, T)

#Temperatura de referinta intre 0 si 70 grade
temp_ref = np.linspace(0, 70, 8)

#Control forward (1 Kl)
temp_iesire1 = [4.93, 12.92, 22.5, 33.9, 47.7, 58.5, 67.5, 71.84]
realizaregrafic("Temperatura - Control forward(1 Kl)", "Temperatura actuala (grade Celsius)", "Temperatura dorita (grade Celsius)", temp_iesire1, temp_ref)

#Control feedback (20 Kl)
temp_iesire2 = [1.61, 10.92, 20.37, 29.87, 39.58, 49.21, 58.75, 68.18]
realizaregrafic("Temperatura - Control feedback(20 Kl)", "Temperatura actuala (grade Celsius)", "Temperatura dorita (grade Celsius)", temp_iesire2, temp_ref)

#Control feedback (40 Kl)
temp_iesire3 = [0.89, 10.51, 20.22, 29.97, 39.81, 49.62, 59.39, 69.09]
realizaregrafic("Temperatura - Control feedback(40 Kl)", "Temperatura actuala (grade Celsius)", "Temperatura dorita (grade Celsius)", temp_iesire3, temp_ref)

#Control feedback (60 Kl)
temp_iesire4 = [0.55, 10.35, 20.15, 29.98, 39.87, 49.75, 59.54, 69.39]
realizaregrafic("Temperatura - Control feedback(60 Kl)", "Temperatura actuala (grade Celsius)", "Temperatura dorita (grade Celsius)", temp_iesire4, temp_ref)

#Control feedback (80 Kl)"
temp_iesire5 = [0.48, 10.28, 20.12, 30, 39.81 ,49.64, 59.76, 69.55]
realizaregrafic("Temperatura - Control feedback(80 Kl)", "Temperatura actuala (grade Celsius)", "Temperatura dorita (grade Celsius)", temp_iesire5, temp_ref)

#Erorile de la Control Feedback
eroare_20 = [-1.61, -0.92, -0.37, 0.13, 0.42, 0.79, 1.25, 1.82]
eroare_40 = [-0.89, -0.51, -0.22, 0.03, 0.19, 0.38, 0.61, 0.91]
eroare_60 = [-0.55, -0.35, -0.15, 0.02, 0.13, 0.25, 0.46, 0.61]
eroare_80 = [-0.48, -0.28, -0.12, 0, 0.29, 0.34, 0.45, 0.53]
plt.figure()
plt.plot(temp_ref,eroare_20,'o--', label="Control feedback (20 Kl)")
plt.plot(temp_ref,eroare_40,'o--', label="Control feedback (40 Kl)")
plt.plot(temp_ref,eroare_60,'o--', label="Control feedback (60 Kl)")
plt.plot(temp_ref,eroare_80,'o--', label="Control feedback (80 Kl)")
plt.title("Eroare - Control feedback")
plt.legend()
plt.grid()
plt.show()

#Erorile de la Control Forward
eroare_0 = [-4.8, -2.9, -2.6, -3.9, -7.7, -8.5, -7.5, -1.87]
plt.figure()
plt.plot(temp_ref,eroare_0,'o--', label="Control forward (1 Kl)")
plt.title("Eroare - Control forward")
plt.legend()
plt.grid()
plt.show()
