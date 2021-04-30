# Dockerfile para Odoo

[English version](https://github.com/Erojase/odoo-dockerfile/blob/main/README.md#L40)

Dockerfile y recursos para Debian arrancado con Systemd

Antes de nada hay que tener instalado Docker  
[Docker para Linux](https://docs.docker.com/engine/install/ubuntu/)  
[Docker para Windows](https://docs.docker.com/docker-for-windows/install/)  
[Docker para MacOs](https://docs.docker.com/docker-for-mac/install/)  
  
# Instalación 
Los siguientes comandos deberán lanzarse desde la treminal de comandos del sistema
 
Para lanzar el Dockerfile y construir la imagen se utiliza el comando:  
```cmd
docker build C:/ruta/de/tu/dockerfile -t nombre_imagen
```  
 La ruta/de/tu/dockerfile deberá ser la ruta de la carpeta en la que esta situado el archivo dockerfile
  

Para correr la imagen una vez creada:  
```cmd
docker run -d --name nombre_contenedor -p 8069:8069 -p 8071:8071 -p 8072:8072 --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro nombre_imagen
```

Una vez iniciado el contenedor puedes entrar en éste con:  
```cmd
docker exec -it --user odoo nombre_contenedor /bin/bash
```
  
  Una vez dentro bastará con lanzar el servicio de odoo con  
  ```bash
  systemctl start odoo
  ```  
  y dirigirte en el navegador web a la dirección [localhost:8069](http://localhost:8069/)
  


# Odoo Dockerfile
