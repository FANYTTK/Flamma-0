import random

class ModeloRothermel:
    def __init__(self, temperatura, humedad, viento, pendiente, oxigenacion, combustible):
        """
        Inicializa usando tus parámetros de simulación.
        Se calculan los componentes necesarios para el modelo de Rothermel.
        """
        self.temperatura = temperatura              # °C
        self.humedad = humedad                      # %
        self.viento = viento                        # m/s
        self.pendiente = pendiente                  # grados
        self.oxigenacion = oxigenacion              # %
        self.combustible = combustible              # valor entre 0 y 1

        # Convertimos a los componentes del modelo original
        self.IR = self.calcular_intensidad_reaccion()
        self.xi = 0.4  # constante de eficiencia geométrica
        self.phi_w = self.calcular_factor_viento()
        self.phi_s = self.calcular_factor_pendiente()
        self.rho_b = 30  # densidad del combustible (kg/m³)
        self.epsilon = 0.8  # eficiencia de combustión
        self.Q_ig = 2500  # energía de ignición (kJ/kg)

    def calcular_intensidad_reaccion(self):
        """
        Aproximación simplificada de la intensidad de reacción (IR),
        ajustada según la temperatura, humedad y oxígeno.
        """
        base = 1500  # valor base de IR
        base += (self.temperatura - 20) * 20
        base -= self.humedad * 5
        base += (self.oxigenacion - 21) * 50
        base += self.combustible * 500
        return max(500, base)  # evitar valores negativos

    def calcular_factor_viento(self):
        """
        Ajusta el factor de viento (phi_w) en base a la velocidad del viento.
        """
        return 1 + 0.1 * self.viento

    def calcular_factor_pendiente(self):
        """
        Ajusta el factor de pendiente (phi_s) en base al ángulo del terreno.
        """
        return 1 + 0.05 * self.pendiente

    def calcular_velocidad_propagacion(self):
        """
        Calcula la velocidad de propagación del fuego en m/min.
        """
        numerador = self.IR * self.xi * self.phi_w * self.phi_s
        denominador = self.rho_b * self.epsilon * self.Q_ig
        R = numerador / denominador
        return round(R, 4)

    def mostrar_detalles(self):
        print("🧪 Parámetros usados en la simulación:")
        print(f"  🔥 Temperatura: {self.temperatura}°C")
        print(f"  💧 Humedad: {self.humedad}%")
        print(f"  🌬️ Viento: {self.viento} m/s")
        print(f"  ⛰️ Pendiente: {self.pendiente}°")
        print(f"  🧪 Oxigenación: {self.oxigenacion}%")
        print(f"  🌲 Combustible: {self.combustible}")
        print(f"  📈 Velocidad estimada del fuego: {self.calcular_velocidad_propagacion()} m/min")

