import tkinter as tk
import mysql.connector
import hashlib
import os
import tkinter as tk
import mysql.connector
from tkinter import *

from tkinter import ttk
import PIL


def submitact():
    user = Username.get()
    passw = password.get()
    logintodb(user, passw)
    salt = os.urandom(32)
    key = hashlib.pbkdf2_hmac('sha256', password.encode('utf-8'), salt, dklen=128)


def logintodb(user, passw):
    # If paswword is entered by the
    # user
    if passw:
        db = mysql.connector.connect(host="localhost",
                                     user=user,
                                     password=passw,
                                     db="zoo")
        cursor = db.cursor()

        # If no password is entered by the
    # user
    else:
        db = mysql.connector.connect(host="localhost",
                                     user=user,
                                     db="zoo")
        cursor = db.cursor()
    cursor = db.cursor()
    button_screen = tk.Toplevel()
    button_screen.title("Select which table you would like to view")
    animal_btn = tk.Button(button_screen, text="animals", width=200, length=200, bg='white',
                           command=animal_query(cursor))
    animal_btn.pack()
    employee_btn = tk.Button(button_screen, text="employees", width=200, length=200, bg='white',
                             command=employee_query(cursor))
    employee_btn.pack()
    supervisor_btn = tk.Button(button_screen, text="employees", width=200, length=200, bg='white',
                               command=supervisor_query(cursor))
    supervisor_btn.pack()
    button_screen.mainloop()


def animal_query(cursor):
    anim_query = "SELECT * FROM animal"
    cursor.execute(anim_query)
    the_result = cursor.fetchall()
    query_screen = tk.Toplevel()
    query_screen.title("Query results")
    tree = ttk.Treeview(query_screen)
    tree["columns"] = (
        "animal id", "name", "sex", "age", "how the zoo acquired them", "health conditions", "species no")

    tree.column("animal_id", width=100)
    tree.column("name", width=100)
    tree.column("sex", width=100)
    tree.column("age", width=100)
    tree.column("how the zoo acquired them", width=100)
    tree.column("health conditions", width=100)
    tree.column("species_no", width=100)
    query_screen.mainloop()


def employee_query(cursor):
    emp_query = "SELECT * FROM employee"
    cursor.execute(emp_query)
    the_result = cursor.fetchall()
    query_screen = tk.Toplevel()
    query_screen.title("Query results")
    tree = ttk.Treeview(query_screen)
    tree["columns"] = (
        "employee id", "first name", "last name", "salary", "sex", "date of birth")

    tree.column("employee id", width=100)
    tree.column("first name", width=100)
    tree.column("last name", width=100)
    tree.column("salary", width=100)
    tree.column("sex", width=100)
    tree.column("date of birth", width=100)
    query_screen.mainloop()


def supervisor_query(cursor):
    emp_query = "SELECT * FROM employee WHERE super_id IN(SELECT emp_id FROM employee)"
    cursor.execute(emp_query)
    the_result = cursor.fetchall()
    query_screen = tk.Toplevel()
    query_screen.title("Query results")
    emp_query = "SELECT * FROM employee"
    cursor.execute(emp_query)
    the_result = cursor.fetchall()
    query_screen = tk.Toplevel()
    query_screen.title = "Query results"
    tree = ttk.Treeview(query_screen)
    tree["columns"] = (
        "employee id", "first name", "last name", "salary", "sex", "date of birth")

    tree.column("employee id", width=100)
    tree.column("first name", width=100)
    tree.column("last name", width=100)
    tree.column("salary", width=100)
    tree.column("sex", width=100)
    tree.column("date of birth", width=100)
    query_screen.mainloop()


root = tk.Tk()
root.geometry("300x300")
root.title("DBMS Login Page")

C = Canvas(root, bg="blue", height=250, width=300)

# Definging the first row
lblfrstrow = tk.Label(root, text="Username -", )
lblfrstrow.place(x=50, y=20)

Username = tk.Entry(root, width=35)
Username.place(x=150, y=20, width=100)

lblsecrow = tk.Label(root, text="Password -")
lblsecrow.place(x=50, y=50)

password = tk.Entry(root, width=35)
password.place(x=150, y=50, width=100)

submitbtn = tk.Button(root, text="Login",
                      bg='blue', command=submitact)
submitbtn.place(x=150, y=135, width=55)

root.mainloop()
