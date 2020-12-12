import tkinter as tk
import mysql.connector
from tkinter import *
from tkinter import ttk


def animal_query(the_cursor):
    anim_query = "SELECT * FROM animal"
    cursor.execute(anim_query)
    the_result = cursor.fetchall()
    query_screen = tk.Toplevel()
    query_screen.title("Query results")
    tree = ttk.Treeview(query_screen)
    tree["columns"] = (
        "animal id", "name", "sex", "age", "how the zoo acquired them", "health conditions", "species no")

    tree.column("animal id", width=100)
    tree.column("name", width=100)
    tree.column("sex", width=100)
    tree.column("age", width=100)
    tree.column("how the zoo acquired them", width=100)
    tree.column("health conditions", width=100)
    tree.column("species no", width=100)
    query_screen.mainloop()


def employee_query(the_cursor):
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


def supervisor_query(the_cursor):
    emp_query = "SELECT * FROM employee WHERE emp_id IN(SELECT super_id FROM employee)"
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

db = mysql.connector.connect(host="localhost",
                             user='root',
                             db="zoo")

cursor = db.cursor()

# test to show that the database is returning the tables
# savequery = "SELECT * from animal"
# cursor.execute(savequery)
# myresult = cursor.fetchall()
# for x in myresult:
#     print(x)
root.title("Select which table you would like to view")
animal_btn = tk.Button(root, text="animals", width=200, length=200, bg='white',
                       command=animal_query(cursor))

employee_btn = tk.Button(root, text="employees", width=200, length=200, bg='white',
                         command=employee_query(cursor))

supervisor_btn = tk.Button(root, text="employees", width=200, length=200, bg='white',
                           command=supervisor_query(cursor))

animal_btn.place(x=150, y=235, width=50)
employee_btn.place(x=150, y=135, width=50)
supervisor_btn.place(x=150, y=35, width=50)

root.mainloop()
