import psycopg2
from flask import Flask, render_template, request

app = Flask(__name__)
conexion = psycopg2.connect(
    host="localhost",
    database="sistema_desarrollo_personal",
    user="postgres",
    password="machukis4ever",
    port="5432"
)

cursor = conexion.cursor()

@app.route("/")
def inicio():
    from flask import request

@app.route("/guardar", methods=["POST"])
def guardar():
    nombre = request.form["nombre"]
    edad = request.form["edad"]
    fecha = request.form["fecha"]
    horas_estudio = request.form["horas_estudio"]
    tareas_completadas = request.form["tareas_completadas"]
    concentracion = request.form["concentracion"]
    rendimiento = request.form["rendimiento"]

    # Insertar en tabla usuario
    cursor.execute(
        "INSERT INTO usuario (nombre, edad) VALUES (%s, %s) RETURNING id_usuario",
        (nombre, edad)
    )
    id_usuario = cursor.fetchone()[0]

    # Insertar en tabla academica
    cursor.execute(
        """INSERT INTO academica 
        (id_usuario, fecha, horas_estudio, tareas_completadas, concentracion, rendimiento)
        VALUES (%s, %s, %s, %s, %s, %s)""",
        (id_usuario, fecha, horas_estudio, tareas_completadas, concentracion, rendimiento)
    )

    conexion.commit()

    return "Datos guardados en la base de datos 😎"
if __name__ == "__main__":
    app.run(debug=True)