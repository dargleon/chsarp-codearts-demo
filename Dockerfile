FROM mono:latest

# Directorio de trabajo en la imagen
WORKDIR /app

# Copiar los artefactos compilados desde la carpeta build
COPY ./build/ ./

# Exponer el puerto en el que la API se ejecuta (5000)
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["mono", "MicroserviceDemo.exe"]
