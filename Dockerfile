FROM openjdk:17-jdk-alpine

WORKDIR /opt/traccar

# Descarga el release ya descomprimido con los binarios
ADD https://github.com/traccar/traccar/releases/download/v6.8.1/traccar-linux-64-6.8.1.tar.gz /tmp/traccar.tar.gz

# Instala tar, descomprime y limpia
RUN apk add --no-cache tar && \
    tar -xzf /tmp/traccar.tar.gz -C . --strip-components=1 && \
    rm /tmp/traccar.tar.gz

# Copia configuración
COPY conf/traccar.xml conf/traccar.xml

# Expón el puerto
EXPOSE 8082

# Ejecuta el servidor
CMD ["./bin/traccar", "start", "foreground"]
