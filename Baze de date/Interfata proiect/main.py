import tkinter as tk
from tkinter import *
from tkinter import ttk
import cx_Oracle as oracle

root = tk.Tk()
root.title("Managementul unui depou de locomotive - Baze de Date")
root.geometry("1024x576")
tabControl = ttk.Notebook(root)

conn = oracle.connect("alexandrunicoi","alexandru#15","193.226.51.37:1521/o11g")

cursor = conn.cursor()


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

#ttk.Label(tab1, text="Listare continut cu posibilitate de sortare").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab2, text="Modificare informatii").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab3, text="Afisare date locomotiva operata de CFR Calatori, cu propulsie Diesel").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab4, text="Exemplificare constrangere on delete cascade").grid(column=0, row=0, padx=30, pady=30)
ttk.Label(tab5, text="Utilizarea vizualizarilor").grid(column=0, row=0, padx=30, pady=30)



#Tab 1

def tabeltab1(table):
    sql = f"SELECT * FROM {table}"
    cursor = conn.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cntcoloane = len(result[0])
    tv = ttk.Treeview(tab1, show = "headings", height = "30")
    if table == 'tip_operator':
        tv["columns"] = (0,1)
    elif table == 'operator':
        tv["columns"] = (0, 1)
    elif table == 'rang':
        tv["columns"] = (0, 1, 2, 3, 4)
    elif table == 'propulsie':
        tv["columns"] = (0, 1)
    elif table == 'alocare':
        tv["columns"] = (0, 1, 2)
    elif table == 'mecanic':
        tv["columns"] = (0, 1, 2, 3, 4)
    elif table == 'producator':
        tv["columns"] = (0, 1, 2, 3, 4)
    elif table == 'locatie':
        tv["columns"] = (0, 1, 2, 3)
    elif table == 'hala':
        tv["columns"] = (0, 1, 2, 3)
    else:
        tv["columns"] = (0,1,2,3,4,5,6,7,8,9)
    tv.pack()
    col_names = [i[0] for i in cursor.description]
    print(col_names)
    for i in range(0,cntcoloane):
        tv.heading(i, text=col_names[i])
        tv.column(i, minwidth=0, width=90)
    for i in result:
        tv.insert('', 'end', values=i)


tabeltab1('locomotiva')


root.mainloop()




