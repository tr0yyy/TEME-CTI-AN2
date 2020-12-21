import tkinter as tk
from tkinter import * 
from tkinter import ttk

root = tk.Tk() 
root.title("Managementul unui depou de locomotive - Baze de Date")
root.geometry("1024x576")  
tabControl = ttk.Notebook(root)

tab1 = ttk.Frame(tabControl)
tab2 = ttk.Frame(tabControl)
tab3 = ttk.Frame(tabControl)
tab4 = ttk.Frame(tabControl)
tab5 = ttk.Frame(tabControl)

tabControl.add(tab1, text = 'Tab 1')
tabControl.add(tab2, text = 'Tab 2')
tabControl.add(tab3, text = 'Tab 3')
tabControl.add(tab4, text = 'Tab 4')
tabControl.add(tab5, text = 'Tab 5')

tabControl.pack(expand = 1, fill = "both")

ttk.Label(tab1, text="Listare continut cu posibilitate de sortare").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab2, text="Modificare informatii").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab3, text="Afisare date locomotiva operata de CFR Calatori, cu propulsie Diesel").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab4, text="Exemplificare constrangere on delete cascade").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab5, text="Utilizarea vizualizarilor").grid(column=0, row=0, padx=30, pady=30)



root.mainloop()  