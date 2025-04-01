import numpy as np
import random

class SimuladorAmbiental:
    def __init__(self, ancho, alto, temperatura, humedad, viento, direccion_viento, oxigenacion, combustible):
        self.ancho = ancho
        self.alto = alto

        # Parámetros físicos
        self.temperatura = temperatura
        self.humedad = humedad
        self.viento = viento
        self.direccion_viento = direccion_viento  # 'N', 'S', 'E', 'O'
        self.oxigenacion = oxigenacion
        self.combustible = combustible

        # Crear matriz (bosque)
        self.matriz = np.zeros((alto, ancho), dtype=int)
        self.pasos = 0

    def encender(self, x, y):
        if 0 <= x < self.alto and 0 <= y < self.ancho:
            self.matriz[x][y] = 1

    def obtener_probabilidad(self, dx, dy):
        """
        Calcula la probabilidad de propagación con base en los parámetros ambientales.
        """
        base = 0.25

        # 🌡️ Temperatura
        if self.temperatura > 30:
            base += 0.1
        elif self.temperatura < 15:
            base -= 0.05

        # 💧 Humedad
        if self.humedad > 60:
            base -= 0.1
        elif self.humedad < 30:
            base += 0.05

        # 🧪 Oxigenación
        base += (self.oxigenacion - 21) * 0.02

        # 🌲 Combustible
        base += self.combustible * 0.1

        # 🌬️ Viento
        direcciones = {'N': (-1, 0), 'S': (1, 0), 'E': (0, 1), 'O': (0, -1)}
        viento_dx, viento_dy = direcciones.get(self.direccion_viento, (0, 0))
        if (dx, dy) == (viento_dx, viento_dy):
            base += self.viento * 0.05

        return max(0, min(base, 1))  # Limitar entre 0 y 1

    def paso(self):
        nueva = self.matriz.copy()
        for i in range(self.alto):
            for j in range(self.ancho):
                if self.matriz[i][j] == 1:
                    nueva[i][j] = 2  # se quema

                    # Propagar a vecinos
                    for dx in [-1, 0, 1]:
                        for dy in [-1, 0, 1]:
                            ni, nj = i + dx, j + dy
                            if (
                                0 <= ni < self.alto and 0 <= nj < self.ancho
                                and self.matriz[ni][nj] == 0
                                and not (dx == 0 and dy == 0)
                            ):
                                prob = self.obtener_probabilidad(dx, dy)
                                if random.random() < prob:
                                    nueva[ni][nj] = 1
        self.matriz = nueva
        self.pasos += 1

    def mostrar(self):
        print(f"\nPaso {self.pasos}")
        for fila in self.matriz:
            print(" ".join(str(c) for c in fila))

    def terminado(self):
        return not np.any(self.matriz == 1)

