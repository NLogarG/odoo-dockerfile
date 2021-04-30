[English version](https://github.com/Erojase/odoo-dockerfile/blob/main/README.md#odoo-dockerfile)

# Dockerfile para Odoo

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

Dockerfile and resources for Debian booted with Systemd

First of all you have to have Docker installed
[Docker for Linux](https://docs.docker.com/engine/install/ubuntu/)
[Docker for Windows](https://docs.docker.com/docker-for-windows/install/)
[Docker for MacOs](https://docs.docker.com/docker-for-mac/install/)
  
# Installation
The following commands must be launched from the system command terminal
 
To launch the Dockerfile and build the image, use the command:
```cmd
docker build C:/path/to/your/dockerfile -t image_name
```
 The path /to/your/dockerfile should be the path of the folder where the dockerfile file is located
  

To run the image once it is created:
```cmd
docker run -d --name container_name -p 8069:8069 -p 8071:8071 -p 8072:8072 --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro image_name
```

Once the container is started, you can enter it with:
```cmd
docker exec -it --user odoo container_name /bin/bash
```
  
Once inside, just launch the odoo service with
```bash
systemctl start odoo
```
and go in the web browser to the address [localhost: 8069](http: // localhost: 8069 /)
