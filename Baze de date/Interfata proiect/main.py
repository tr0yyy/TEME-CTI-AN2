import tkinter as tk
from tkinter import *
from tkinter import ttk
import cx_Oracle as oracle

root = tk.Tk()
root.title("Managementul unui depou de locomotive - Baze de Date")
root.geometry("1024x576")
tabControl = ttk.Notebook(root)

conn = oracle.connect("username","password","linkbazadedate")

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

def selectallfrom(table):
    sql = f"SELECT * FROM {table}"
    return sql

def selectallfromasc(table,order):
    sql = f"SELECT * FROM {table} ORDER BY {order} asc"
    return sql

def selectallfromdesc(table,order):
    sql = f"SELECT * FROM {table} ORDER BY {order} desc"
    return sql

def commitsql():
    cursor.execute("commit")

def rollbacksql():
    cursor.execute("rollback")

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
        tv["columns"] = (0, 1, 2, 3, 4)
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

#tab2

texttab2 = Label(tab2, text="Alege tabelul din lista de mai jos")
texttab2.place(x = 10, y = 10)
listtab2 = Listbox(tab2, selectmode='single')
listtab2.place(x=10 , y = 30)
listtab2.insert(1,'operator')
listtab2.insert(2,'tip_operator')
listtab2.insert(3,'rang')
listtab2.insert(4,'propulsie')
listtab2.insert(5,'alocare')
listtab2.insert(6,'mecanic')
listtab2.insert(7,'producator')
listtab2.insert(8,'locatie')
listtab2.insert(9,'hala')
listtab2.insert(10,'locomotiva')

def executeselect(table, item):
    column = ""
    if table == 'operator':
        column = "op_id"
    elif table == 'tip_operator':
        column = "tipop_id"
    elif table == 'rang':
        column = "rang_id"
    elif table == 'propulsie':
        column = "propulsie_id"
    elif table == 'alocare':
        column = "id"
    elif table == 'mecanic':
        column = "mecanic_id"
    elif table == 'producator':
        column = "prod_id"
    elif table == 'locatie':
        column = "locatie_id"
    elif table == 'hala':
        column = "hala_id"
    else:
        column = "loco_id"
    sql = f"SELECT {column} from {table} where {column} = {item}"
    return sql

Ltab2 = Label(tab2, text="Scrie ID-ul unic al inregistrarii")
Etab2 = Entry(tab2, bd=2)
Ltab3 = Label(tab2, text="Scrie coloana pe care vrei sa o modifici")
Etab3 = Entry(tab2, bd=2)
Ltab4 = Label(tab2, text="Scrie valoarea / textul cu care vrei sa modifici inregistrarea")
Etab4 = Entry(tab2, bd=2)

varchar = ["tip_operator","nume_operator","nume_rang","nume_propulsie","nume","prenume","data_angajarii","oras","regiune","tara","nume_producator","sediu"]


def selectitem():
    cs = listtab2.curselection()
    text = listtab2.get(cs)
    entry = Etab2.get()
    Etab2.delete(0, END)
    Etab2.insert(0, "")
    sql = executeselect(text,entry)
    print(sql)
    result = cursor.execute(sql)
    linie = result.fetchall()
    print(linie)

def modifyitem():
    cs = listtab2.curselection()
    tabel = listtab2.get(cs)
    coloana = Etab3.get()
    id = Etab2.get()
    sql = ""
    id_inreg = ""
    new = Etab4.get()
    if tabel == 'operator':
        id_inreg = "op_id"
    elif tabel == 'tip_operator':
        id_inreg = "tipop_id"
    elif tabel == 'rang':
        id_inreg = "rang_id"
    elif tabel == 'propulsie':
        id_inreg = "propulsie_id"
    elif tabel == 'alocare':
        id_inreg = "id"
    elif tabel == 'mecanic':
        id_inreg = "mecanic_id"
    elif tabel == 'producator':
        id_inreg = "prod_id"
    elif tabel == 'locatie':
        id_inreg = "locatie_id"
    elif tabel == 'hala':
        id_inreg = "hala_id"
    else:
        id_inreg = "loco_id"
    if coloana in varchar:
        sql = f"UPDATE {tabel} SET {coloana} = '{new}' WHERE {id_inreg} = {id}"
    else:
        sql = f"UPDATE {tabel} SET {coloana} = {new} WHERE {id_inreg} = {id}"
    cursor.execute(sql)
    cursor.execute("commit")
    Etab2.delete(0, END)
    Etab2.insert(0, "")
    Etab3.delete(0, END)
    Etab3.insert(0, "")
    Etab4.delete(0, END)
    Etab4.insert(0, "")


def deleteitem():
    cs = listtab2.curselection()
    tabel = listtab2.get(cs)
    id = Etab2.get()
    if tabel == 'operator':
        id_inreg = "op_id"
    elif tabel == 'tip_operator':
        id_inreg = "tipop_id"
    elif tabel == 'rang':
        id_inreg = "rang_id"
    elif tabel == 'propulsie':
        id_inreg = "propulsie_id"
    elif tabel == 'alocare':
        id_inreg = "id"
    elif tabel == 'mecanic':
        id_inreg = "mecanic_id"
    elif tabel == 'producator':
        id_inreg = "prod_id"
    elif tabel == 'locatie':
        id_inreg = "locatie_id"
    elif tabel == 'hala':
        id_inreg = "hala_id"
    else:
        id_inreg = "loco_id"
    sql = f"DELETE FROM {tabel} WHERE {id_inreg} = {id}"
    cursor.execute(sql)
    Etab2.delete(0, END)
    Etab2.insert(0, "")
    Etab3.delete(0, END)
    Etab3.insert(0, "")
    Etab4.delete(0, END)
    Etab4.insert(0, "")



def aparitielabel(table):
    Ltab2.place(x = 180, y = 70)
    Etab2.place(x=180, y=100) #id-ul inregistrarii
    Ltab3.place(x=470,y=70)
    Etab3.place(x=470, y=100) #coloana
    Ltab4.place(x=470, y=130)
    Etab4.place(x=470, y=160) #valoare de suprascriere
    butontab3 = Button(tab2, text='Sterge!', command=deleteitem)
    butontab3.place(x=200, y=130)
    butontab2 = Button(tab2, text='Modifica!', command=modifyitem)
    butontab2.place(x=470, y=190)

def go(event):
    cs = listtab2.curselection()
    text = listtab2.get(cs)
    aparitielabel(text)

listtab2.bind('<Double-1>', go)


#tab3

tv_tab3 = ttk.Treeview(tab3, show = "headings", height = "10")
L1_tab3 = Label(tab3, text="Afisare locomotive tip electric, produse de Electroputere Craiova")
L1_tab3.place(x= 80, y = 270)

def tabeltab3():
    sql = "select nume_producator, nume_propulsie, clasa, numar_parc from producator p join locomotiva l on p.prod_id = l.prod_id join propulsie pp on l.propulsie_id = pp.propulsie_id where nume_producator like 'Electroputere' and nume_propulsie like 'electric'"
    cursor = conn.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cntcoloane = len(result[0])
    tv_tab3["columns"] = (0,1,2,3)
    tv_tab3.pack()
    col_names = [i[0] for i in cursor.description]
    for i in range(0,cntcoloane):
        tv_tab3.heading(i, text=col_names[i])
        tv_tab3.column(i, minwidth=0, width=160)
    for i in result:
        tv_tab3.insert('', 'end', values=i)
    cursor.execute("commit")

def actiunebutontab3():
     for i in tv_tab3.get_children():
         tv_tab3.delete(i)
     tabeltab3()


butontab3 = Button(tab3,text='Afiseaza tabel', command=actiunebutontab3)
butontab3.place(x = 80, y = 300)

#tab4

tv_tab4 = ttk.Treeview(tab4, show = "headings", height = "10")
L1_tab4 = Label(tab4, text="Afisare numarul de locomotive grupate dupa tipul de propulsie mai mare decat 5")
L1_tab4.place(x= 80, y = 270)

def tabeltab4():
    sql = """select count(loco_id) as "Nr. locomotive", nume_propulsie from locomotiva join propulsie using (propulsie_id) group by nume_propulsie having count(loco_id) > 5"""
    cursor = conn.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cntcoloane = len(result[0])
    tv_tab4["columns"] = (0,1)
    tv_tab4.pack()
    col_names = [i[0] for i in cursor.description]
    for i in range(0,cntcoloane):
        tv_tab4.heading(i, text=col_names[i])
        tv_tab4.column(i, minwidth=0, width=160)
    for i in result:
        tv_tab4.insert('', 'end', values=i)
    cursor.execute("commit")

def actiunebutontab4():
     for i in tv_tab4.get_children():
         tv_tab4.delete(i)
     tabeltab4()


butontab4 = Button(tab4,text='Afiseaza tabel', command=actiunebutontab4)
butontab4.place(x = 80, y = 300)


root.mainloop()