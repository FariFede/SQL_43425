import grt
import mysql.connector
import random
import string


def generar_clave():
    clave = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    cursor = conexion.cursor()
    consulta = "SELECT * FROM pacientes WHERE paciente_id = %s"
    valores = (clave,)
    cursor.execute(consulta, valores)
    result = cursor.fetchone()
    while result:
        clave = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        valores = (clave,)
        cursor.execute(consulta, valores)
        result = cursor.fetchone()
    return clave

def insertar_fila():
    cursor = conexion.cursor()
    consulta = "INSERT INTO pacientes (paciente_id) VALUES (%s)"
    clave = generar_clave()
    cursor.execute(consulta, [clave])
    conexion.commit()
    print("Fila insertada correctamente.")

def mostrar_tablas():
    cursor = conexion.cursor()
    consulta = "SELECT * FROM pacientes"
    cursor.execute(consulta)
    a = cursor.fetchall()
    print(a)


if __name__ == "__main__":
    
    conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="mipassword",
    database="consultorio"
    )

    insertar_fila()
    mostrar_tablas()
    conexion.close()

