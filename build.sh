#!/bin/bash
set -e

echo "=== Starting Build Process ==="
echo "=== Current directory: $(pwd) ==="

cd src/MicroserviceDemo

echo "=== Project Contents ==="
ls -la

echo "=== Inspecting .csproj File ==="
cat MicroserviceDemo.csproj

echo "=== Restoring Dependencies ==="
# Usar el comando dotnet restore para restaurar dependencias correctamente
dotnet restore

echo "=== Building Project with dotnet build ==="
# Compilación usando dotnet build en lugar de msbuild
dotnet build -c Release -o ../../build

echo "=== Build Completed ==="
cd ../..

echo "=== Creating Build Artifacts ==="
mkdir -p build
zip -r build/archive.zip build/*

echo "=== Build Artifacts Created ==="
