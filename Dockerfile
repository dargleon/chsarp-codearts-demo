# Usa la imagen oficial de .NET 6.0 SDK
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Configura el directorio de trabajo
WORKDIR /app

# Copia todo el contenido al contenedor
COPY . .

# Restaura dependencias
RUN dotnet restore ./src/MicroserviceDemo/MicroserviceDemo.csproj

# Compila el proyecto en modo Release
RUN dotnet build ./src/MicroserviceDemo/MicroserviceDemo.csproj -c Release -o ./build

# Publica el proyecto (opcional pero recomendado)
RUN dotnet publish ./src/MicroserviceDemo/MicroserviceDemo.csproj -c Release -o ./publish

# Imagen final de runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MicroserviceDemo.dll"]
