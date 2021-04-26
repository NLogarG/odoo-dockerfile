docker run -d --name prueba -p 1234:8069 --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro prueba
docker exec -it prueba /bin/bash