FROM traccar/traccar:latest

# Copiar el archivo de configuración al lugar correcto
COPY traccar.xml /opt/traccar/conf/traccar.xml

# Asegúrate de que Traccar escuche en el puerto asignado por Render
ENV PORT=8082

# Expón el puerto (opcional en Render, pero recomendado)
EXPOSE 8082

# Ejecuta en primer plano para que Render mantenga vivo el contenedor
CMD ["./traccar.run", "start", "foreground"]
