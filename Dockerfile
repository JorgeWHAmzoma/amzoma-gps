FROM traccar/traccar:latest

COPY traccar.xml /opt/traccar/conf/traccar.xml

# Asegúrate de que Traccar escuche en el puerto asignado por Render
ENV PORT=8082

# Expón el puerto (opcional en Render, pero recomendado)
EXPOSE 8082
