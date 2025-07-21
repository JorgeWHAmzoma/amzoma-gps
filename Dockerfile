FROM openjdk:17-jdk-alpine

WORKDIR /opt/traccar

RUN apk add --no-cache unzip bash curl

# Descarga la versión ya compilada
ADD https://github.com/traccar/traccar/releases/download/v6.8.1/traccar-linux-64-6.8.1.zip /tmp/traccar.zip

# Descomprime
RUN unzip /tmp/traccar.zip -d . && rm /tmp/traccar.zip

# Lista la estructura para debug (puedes quitar luego)
RUN ls -lR

# Copia tu archivo de configuración personalizado
COPY conf/traccar.xml conf/traccar.xml

# Expón el puerto por defecto
EXPOSE 8082

# Cambia la ruta al ejecutable según corresponda (ejemplo aquí)
CMD ["sh", "-c", "chmod +x ./traccar && ./traccar start foreground"]
