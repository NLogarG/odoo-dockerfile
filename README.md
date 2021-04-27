# Dockerfile
Dockerfile y recursos para Ubuntu y Debian arrancados con Systemd

Para lanzar el Dockerfile y construir la imagen se utiliza el comando:  
```docker build C:/ruta/de/tu/dockerfile -t nombre_imagen```

Para correr la imagen una vez creada:  
```docker run -d --name nombre_contenedor -p 8069:8069 --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro nombre_imagen```

Una vez iniciado el contenedor puedes entrar en éste con:  
```docker exec -it nombre_contenedor /bin/bash```
