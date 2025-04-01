from simulador_ambiental import SimuladorAmbiental

sim = SimuladorAmbiental(
    ancho=10,
    alto=10,
    temperatura=35,
    humedad=20,
    viento=5,
    direccion_viento='E',
    oxigenacion=22,
    combustible=0.8
)

sim.encender(5, 5)

while not sim.terminado():
    sim.mostrar()
    sim.paso()

sim.mostrar()

