name: Entrenamiento de modelo

on:
  push:
    branches: [backend]   # o la rama que uses
  workflow_dispatch:   # para correrlo manualmente desde GitHub

jobs:
  train:
    runs-on: ubuntu-latest

    steps:
      - name: Clonar repositorio
        uses: actions/checkout@v3

      - name: Configurar Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'

      - name: Instalar dependencias
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt

      - name: Ejecutar entrenamiento
        run: |
          python train.py

