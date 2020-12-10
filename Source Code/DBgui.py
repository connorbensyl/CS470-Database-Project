import tkinter as tk
import mysql.connector

import tkinter as tk
import mysql.connector
from tkinter import *
import PIL


def submitact():
    user = Username.get()
    passw = password.get()
    logintodb(user, passw)
    print(f"The name entered by you is {user} {passw}")


def logintodb(user, passw):
    # If paswword is entered by the
    # user
    if passw:
        db = mysql.connector.connect(host="kc-sce-appdb01",
                                     user=user,
                                     password=passw,
                                     db="cjbdxd")
        cursor = db.cursor()

        # If no password is enetered by the
    # user
    else:
        db = mysql.connector.connect(host="kc-sce-appdb01",
                                     user=user,
                                     db="cjbdxd")
        cursor = db.cursor()

    #     # A Table in the database
    # savequery = "select * from ANIMAL"
    #
    # try:
    #     cursor.execute(savequery)
    #     myresult = cursor.fetchall()
    #
    #     # Printing the result of the
    #     # query
    #     for x in myresult:
    #         print(x)
    #     print("Query Excecuted successfully")
    #
    # except:
    #     db.rollback()
    #     print("Error occured")

    animal_query = "SELECT * FROM animal"
    employee_query = "SELECT * FROM employee"
    supervisor_query = "SELECT * FROM employee WHERE super_id IN(SELECT habitat_number FROM habitat)"
    animal_btn = tk.Button(root, text="animals", width=200, length=200, bg='white',
                           command=cursor.execute(animal_query))
    employee_btn = tk.Button(root, text="employees", width=200, length=200, bg='white',
                             command=cursor.execute(employee_query))
    supervisor_btn = tk.Button(root, text="employees", width=200, length=200, bg='white',
                               command=cursor.execute(supervisor_query))


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
