#!/bin/bash
set -e

echo "=== Compilación con Mono Linux ==="
cd src/MicroserviceDemo

# Configurar fuentes y compilar el proyecto
nuget sources Disable -Name nuget.org
nuget sources add -Name huaweicloud -Source https://repo.huaweicloud.com/repository/nuget/v3/index.json
nuget restore MicroserviceDemo.csproj
msbuild MicroserviceDemo.csproj /p:Configuration=Release /p:OutputPath=../../build

echo "=== Compilación completada ==="

# Regresar a la raíz del repositorio
cd ../..

echo "=== Creando archivo ZIP de la compilación ==="
zip -r build/archive.zip build/MicroserviceDemo.exe build/MicroserviceDemo.pdb

echo "=== Archivo archivado copiado a build/ ==="
