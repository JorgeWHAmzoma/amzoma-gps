FROM openjdk:17-jdk-alpine

WORKDIR /opt/traccar

# Descarga la versión ya compilada
ADD https://github.com/traccar/traccar/releases/download/v6.8.1/traccar-linux-64-6.8.1.zip /tmp/traccar.zip

# Instala unzip, descomprime y limpia
RUN apk add --no-cache unzip && unzip /tmp/traccar.zip -d . && rm /tmp/traccar.zip

# Copia tu archivo de configuración personalizado
COPY conf/traccar.xml conf/traccar.xml

# Expón el puerto por defecto de la web
EXPOSE 8082

# Asegura permisos de ejecución y ejecuta Traccar en modo foreground
CMD ["sh", "-c", "chmod +x ./bin/traccar && ./bin/traccar start foreground"]
