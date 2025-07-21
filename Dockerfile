FROM openjdk:17-jdk-alpine

WORKDIR /opt/traccar

# Instala utilidades necesarias
RUN apk add --no-cache bash unzip coreutils

# Descarga el instalador .run de Traccar
ADD https://github.com/traccar/traccar/releases/download/v6.8.1/traccar-linux-64-6.8.1.zip /tmp/traccar.zip

# Extrae el .run y da permisos
RUN unzip /tmp/traccar.zip -d /tmp && \
    chmod +x /tmp/traccar.run

# Ejecuta el instalador .run con bash
RUN /tmp/traccar.run -q && rm -rf /tmp/traccar.*

# Copia tu configuración personalizada
COPY conf/traccar.xml /opt/traccar/conf/traccar.xml

# Expón el puerto web
EXPOSE 8082

# Ejecuta en primer plano para que Render lo mantenga activo
CMD ["./bin/traccar", "start", "foreground"]
