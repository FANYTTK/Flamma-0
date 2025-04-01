import numpy as np
import matplotlib.pyplot as plt
import os
from tqdm import tqdm  # Para mostrar progreso

def guardar_imagen(matriz, nombre_archivo, cmap='inferno'):
    """
    Guarda una matriz como imagen con un colormap tipo fuego.
    """
    plt.figure(figsize=(1.28, 1.28), dpi=50)  # Tamaño exacto para 64x64 px
    plt.imshow(matriz, cmap=cmap, interpolation='nearest')
    plt.axis('off')
    plt.tight_layout(pad=0)
    plt.savefig(nombre_archivo, bbox_inches='tight', pad_inches=0)
    plt.close()

def generar_matriz_simulada(tamano):
    """
    Genera una matriz aleatoria que simula una escena de incendio.
    Puedes mejorarla usando tu simulador ambiental real.
    """
    base = np.random.rand(tamano, tamano) * 100

    # Simular un "foco de calor"
    centro_x = np.random.randint(10, tamano - 10)
    centro_y = np.random.randint(10, tamano - 10)
    for i in range(-5, 6):
        for j in range(-5, 6):
            if 0 <= centro_x + i < tamano and 0 <= centro_y + j < tamano:
                base[centro_x + i][centro_y + j] += np.random.uniform(100, 200)

    base = np.clip(base, 0, 255)  # Normalizar
    return base

def generar_imagenes_sinteticas(cantidad=500, tamano=64, carpeta='fire_dataset'):
    """
    Genera imágenes sintéticas y las guarda en la carpeta especificada.
    """
    if not os.path.exists(carpeta):
        os.makedirs(carpeta)

    for i in tqdm(range(cantidad), desc="Generando imágenes"):
        matriz = generar_matriz_simulada(tamano)
        nombre = os.path.join(carpeta, f"img_{i:03}.png")
        guardar_imagen(matriz, nombre)

    print(f"\nSe han generado {cantidad} imágenes en la carpeta '{carpeta}'")

if __name__ == '__main__':
    generar_imagenes_sinteticas()
