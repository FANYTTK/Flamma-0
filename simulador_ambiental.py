import numpy as np
import random

class SimuladorCeldaACelda:
    def __init__(self, ancho, alto, direccion_viento, viento_global):
        self.ancho = ancho
        self.alto = alto
        self.direccion_viento = direccion_viento
        self.viento = viento_global

        # Estados: 0 = sin fuego, 1 = encendido, 2 = quemado
        self.estado = np.zeros((alto, ancho), dtype=int)

        # Cada celda tendrá su propio valor
        self.temperatura = np.random.randint(15, 45, size=(alto, ancho))           # °C
        self.humedad = np.random.randint(10, 80, size=(alto, ancho))               # %
        self.oxigenacion = np.random.uniform(19, 23, size=(alto, ancho))           # %
        self.combustible = np.random.uniform(0.3, 1.0, size=(alto, ancho))         # [0,1]

        self.pasos = 0

    def encender(self, x, y):
        if 0 <= x < self.alto and 0 <= y < self.ancho:
            self.estado[x][y] = 1

    def obtener_probabilidad(self, i, j, dx, dy):
        """
        Calcula la probabilidad de propagación en base a los valores únicos de la celda destino.
        """
        ni, nj = i + dx, j + dy
        if not (0 <= ni < self.alto and 0 <= nj < self.ancho):
            return 0

        temp = self.temperatura[ni][nj]
        hum = self.humedad[ni][nj]
        oxi = self.oxigenacion[ni][nj]
        comb = self.combustible[ni][nj]

        base = 0.2

        # 🌡Temperatura
        if temp > 30:
            base += 0.1
        elif temp < 15:
            base -= 0.05

        # Humedad
        if hum > 60:
            base -= 0.1
        elif hum < 30:
            base += 0.05

        # Oxigenación
        base += (oxi - 21) * 0.02

        # Combustible
        base += comb * 0.1

        # 🌬Viento (si se propaga en dirección del viento)
        direcciones = {'N': (-1, 0), 'S': (1, 0), 'E': (0, 1), 'O': (0, -1)}
        viento_dx, viento_dy = direcciones.get(self.direccion_viento, (0, 0))
        if (dx, dy) == (viento_dx, viento_dy):
            base += self.viento * 0.05

        return max(0, min(base, 1))

    def paso(self):
        nueva = self.estado.copy()
        for i in range(self.alto):
            for j in range(self.ancho):
                if self.estado[i][j] == 1:
                    nueva[i][j] = 2
                    for dx in [-1, 0, 1]:
                        for dy in [-1, 0, 1]:
                            ni, nj = i + dx, j + dy
                            if (
                                0 <= ni < self.alto and 0 <= nj < self.ancho
                                and self.estado[ni][nj] == 0
                                and not (dx == 0 and dy == 0)
                            ):
                                prob = self.obtener_probabilidad(i, j, dx, dy)
                                if random.random() < prob:
                                    nueva[ni][nj] = 1
        self.estado = nueva
        self.pasos += 1

    def mostrar(self):
        print(f"\nPaso {self.pasos}")
        for fila in self.estado:
            print(" ".join(str(c) for c in fila))

    def terminado(self):
        return not np.any(self.estado == 1)

