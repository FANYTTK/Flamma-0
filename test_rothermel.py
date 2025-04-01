from rothermel import ModeloRothermel
import random

# Generar parámetros aleatorios en rangos realistas
temperatura = random.randint(15, 45)             # °C
humedad = random.randint(10, 80)                 # %
viento = round(random.uniform(0.5, 10), 2)        # m/s
pendiente = random.randint(0, 45)                # grados
oxigenacion = round(random.uniform(19, 23), 2)   # %
combustible = round(random.uniform(0.3, 1.0), 2) # intensidad de combustible

# Crear el modelo y mostrar resultados
modelo = ModeloRothermel(
    temperatura=temperatura,
    humedad=humedad,
    viento=viento,
    pendiente=pendiente,
    oxigenacion=oxigenacion,
    combustible=combustible
)

modelo.mostrar_detalles()

