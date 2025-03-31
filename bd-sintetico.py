import pandas as pd
import numpy as np

np.random.seed(42)

n = 1000  # número de registros sintéticos

data = {
    'temperatura': np.random.uniform(15, 45, n),
    'humedad': np.random.uniform(10, 90, n),
    'viento': np.random.uniform(0, 70, n),
    'oxigenacion': np.random.uniform(15, 23, n),
    'humedadSuelo': np.random.uniform(5, 95, n),
    'altitud': np.random.uniform(0, 3000, n),
    'tipoVegetacion': np.random.choice(['pasto', 'matorral', 'bosque'], n),
    'nivelRiesgo': np.random.choice(['bajo', 'medio', 'alto'], n)
}

df = pd.DataFrame(data)

# Reglas simples para definir el estado de la simulación
def estado(row):
    if row['temperatura'] > 35 and row['viento'] > 40 and row['humedad'] < 30:
        return 'crítico'
    elif row['nivelRiesgo'] == 'alto' and row['temperatura'] > 30:
        return 'peligroso'
    else:
        return 'controlado'

df['estadoSimulacion'] = df.apply(estado, axis=1)

# Guardar
df.to_csv('datos_sinteticos.csv', index=False)
