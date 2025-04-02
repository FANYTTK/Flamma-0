import math

class ModeloRothermel:
    def __init__(self, temperatura, humedad, viento, pendiente, oxigenacion, combustible):
        """
        Inicializa los parámetros necesarios para el modelo de Rothermel.
        
        Parámetros:
        - temperatura (°C): Temperatura ambiente.
        - humedad (%): Humedad relativa del entorno.
        - viento (m/s): Velocidad del viento.
        - pendiente (grados): Pendiente del terreno.
        - oxigenacion (%): Porcentaje de oxígeno disponible.
        - combustible (0 a 1): Proporción de combustible disponible.
        """
        self.temperatura = temperatura
        self.humedad = humedad
        self.viento = viento
        self.pendiente = pendiente
        self.oxigenacion = oxigenacion
        self.combustible = max(0.0, min(1.0, combustible))  # Limitar entre 0 y 1

        # Constantes y valores asumidos
        self.xi = 0.4                 # Eficiencia geométrica del frente de llama
        self.rho_b = 30.0            # Densidad del combustible (kg/m³)
        self.epsilon = 0.8           # Eficiencia de combustión (proporción de combustible consumido)
        self.Q_ig = 2500.0           # Energía de ignición (kJ/kg)
        
        # Cálculo de componentes del modelo
        self.IR = self.calcular_intensidad_reaccion()
        self.phi_w = self.calcular_factor_viento()
        self.phi_s = self.calcular_factor_pendiente()

    def calcular_intensidad_reaccion(self):
        """
        Calcula la intensidad de reacción (IR), ajustada por condiciones ambientales.
        
        Esta fórmula es una aproximación basada en componentes clave:
        - Incrementa con temperatura.
        - Disminuye con humedad.
        - Aumenta con oxigenación y cantidad de combustible.
        """
        base_IR = 1500.0

        # Aporte de la temperatura
        base_IR += (self.temperatura - 20.0) * 20.0

        # Penalización por humedad
        base_IR -= self.humedad * 5.0

        # Oxigenación: se toma 21% como base
        base_IR += (self.oxigenacion - 21.0) * 50.0

        # Aporte directo del combustible
        base_IR += self.combustible * 500.0

        # Valor mínimo para evitar resultados no realistas
        return max(500.0, base_IR)

    def calcular_factor_viento(self):
        """
        Calcula el factor de propagación del fuego debido al viento (phi_w).
        Relación lineal básica: a más viento, mayor propagación.
        """
        return 1.0 + 0.1 * self.viento

    def calcular_factor_pendiente(self):
        """
        Calcula el factor de propagación debido a la pendiente (phi_s).
        Considera que el fuego se propaga más rápido cuesta arriba.
        """
        return 1.0 + 0.05 * self.pendiente

    def calcular_velocidad_propagacion(self):
        """
        Calcula la velocidad de propagación del fuego (R) en metros por minuto.
        
        Fórmula:
            R = (IR * xi * phi_w * phi_s) / (rho_b * epsilon * Q_ig)
        """
        numerador = self.IR * self.xi * self.phi_w * self.phi_s
        denominador = self.rho_b * self.epsilon * self.Q_ig

        R = numerador / denominador
        return round(R, 6)

    def obtener_resultados(self):
        """
        Retorna los resultados de la simulación en un diccionario.
        """
        return {
            "temperatura": self.temperatura,
            "humedad": self.humedad,
            "viento": self.viento,
            "pendiente": self.pendiente,
            "oxigenacion": self.oxigenacion,
            "combustible": self.combustible,
            "IR": round(self.IR, 2),
            "phi_w": round(self.phi_w, 2),
            "phi_s": round(self.phi_s, 2),
            "velocidad_propagacion": self.calcular_velocidad_propagacion()
        }

    def mostrar_detalles(self):
        """
        Muestra en consola los parámetros de entrada y los resultados obtenidos.
        """
        print("===== MODELO DE ROTHERMEL - SIMULACIÓN =====")
        print(f"Temperatura:            {self.temperatura} °C")
        print(f"Humedad relativa:       {self.humedad} %")
        print(f"Velocidad del viento:   {self.viento} m/s")
        print(f"Pendiente del terreno:  {self.pendiente} grados")
        print(f"Oxigenación ambiental:  {self.oxigenacion} %")
        print(f"Combustible disponible: {self.combustible}")
        print("--------------------------------------------")
        print(f"Intensidad de reacción (IR):       {round(self.IR, 2)}")
        print(f"Factor por viento (phi_w):         {round(self.phi_w, 2)}")
        print(f"Factor por pendiente (phi_s):      {round(self.phi_s, 2)}")
        print(f"Velocidad de propagación estimada: {self.calcular_velocidad_propagacion()} m/min")
        print("============================================\n")

# Ejemplo de uso
if __name__ == "__main__":
    # Parámetros de ejemplo
    modelo = ModeloRothermel(
        temperatura=32,
        humedad=15,
        viento=4,
        pendiente=10,
        oxigenacion=22,
        combustible=0.75
    )
    modelo.mostrar_detalles()


