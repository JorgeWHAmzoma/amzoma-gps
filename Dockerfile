FROM openjdk:17-jdk-alpine

WORKDIR /opt/traccar

# Descarga la última versión 64 bits (6.8.1)
ADD https://github.com/traccar/traccar/releases/download/v6.8.1/traccar-linux-64-6.8.1.zip /tmp/traccar.zip

# Instala unzip, descomprime y limpia
RUN apk add --no-cache unzip && unzip /tmp/traccar.zip -d . && rm /tmp/traccar.zip

EXPOSE 8082

CMD ["./traccar.run"]
