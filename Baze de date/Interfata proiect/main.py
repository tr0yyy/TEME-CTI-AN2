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

def selectallfrom(table):
    sql = f"SELECT * FROM {table}"
    return sql

def selectallfromasc(table,order):
    sql = f"SELECT * FROM {table} ORDER BY {order} asc"
    return sql

def selectallfromdesc(table,order):
    sql = f"SELECT * FROM {table} ORDER BY {order} desc"
    return sql

#Tab 1

def tabeltab1(table):
    sql = selectallfrom(table)
    cursor = conn.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cntcoloane = len(result[0])
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
    for i in range(0,cntcoloane):
        tv.heading(i, text=col_names[i])
        if cntcoloane > 5:
            tv.column(i, minwidth=0, width=90)
        else:
            tv.column(i, minwidth=0, width=160)
    for i in result:
        tv.insert('', 'end', values=i)
    cursor.execute("commit")

def tabeltab1(table):
    sql = selectallfrom(table)
    cursor = conn.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cntcoloane = len(result[0])
    if table == 'operator':
        tv["columns"] = (0, 1, 2, 3, 4)
    elif table == 'tip_operator':
        tv["columns"] = (0,1)
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
    for i in range(0,cntcoloane):
        tv.heading(i, text=col_names[i])
        if cntcoloane > 5:
            tv.column(i, minwidth=0, width=90)
        else:
            tv.column(i, minwidth=0, width=160)
    for i in result:
        tv.insert('', 'end', values=i)
    cursor.execute("commit")

def tabelsorttab1(table,order,cond):
    if cond == -1:
        sql = selectallfromasc(table,order)
    else:
        sql = selectallfromdesc(table,order)
    cursor = conn.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cntcoloane = len(result[0])
    if table == 'operator':
        tv["columns"] = (0, 1, 2, 3, 4)
    elif table == 'tip_operator':
        tv["columns"] = (0,1)
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
    for i in range(0,cntcoloane):
        tv.heading(i, text=col_names[i])
        if cntcoloane > 5:
            tv.column(i, minwidth=0, width=90)
        else:
            tv.column(i, minwidth=0, width=130)
    for i in result:
        tv.insert('', 'end', values=i)
    cursor.execute("commit")

def actiunebuton1():
    entry = E1.get()
    E1.delete(0, END)
    E1.insert(0, "")
    for i in tv.get_children():
        tv.delete(i)
    tabeltab1(entry)

def actiunebuton2():
    entry = E1.get()
    E1.delete(0, END)
    E1.insert(0, "")
    coloana = E2.get()
    E2.delete(0, END)
    E2.insert(0, "")
    for i in tv.get_children():
        tv.delete(i)
    tabelsorttab1(entry,coloana,-1)


def actiunebuton3():
    entry = E1.get()
    E1.delete(0, END)
    E1.insert(0, "")
    coloana = E2.get()
    E2.delete(0, END)
    E2.insert(0, "")
    for i in tv.get_children():
        tv.delete(i)
    tabelsorttab1(entry, coloana, 1)

tv = ttk.Treeview(tab1, show = "headings", height = "10")
L1 = Label(tab1, text="Denumire tabel: ")
L1.place(x= 80, y = 270)
E1 = Entry(tab1, bd =2)
E1.place(x= 180, y = 270)
butontab1 = Button(tab1,text='Afiseaza tabel', command=actiunebuton1)
butontab1.place(x = 80, y = 300)
L2 = Label(tab1, text="Sorteaza dupa coloana: ")
L2.place(x= 350, y =270)
E2 = Entry(tab1, bd=2)
E2.place(x = 480,y = 270)
butontab2 = Button(tab1,text='Crescator', command=actiunebuton2)
butontab2.place(x = 350, y = 300)
butontab3 = Button(tab1,text='Descrescator', command=actiunebuton3)
butontab3.place(x = 480, y = 300)


root.mainloop()




