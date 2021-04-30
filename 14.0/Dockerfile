FROM jrei/systemd-debian  
RUN apt update && apt -y upgrade &&\
    apt install -y sudo &&\
    apt-get install -y wget &&\
    apt install -y nano &&\
    #Add odoo user
    usermod -aG sudo root &&\
    adduser odoo &&\
    echo odoo:odoo | chpasswd &&\
    usermod -aG sudo odoo &&\
    #Install postgres
    export DEBIAN_FRONTEND=noninteractive && apt install -y postgresql
COPY pg_hba.conf /etc/postgresql/12/main/
RUN usermod -aG sudo postgres &&\
    echo postgres:odoo | chpasswd &&\
    su - postgres &&\
    pg_ctlcluster 11 main start &&\
    exit 
    #Postgres create user
RUN echo "listen_addresses='*'" >> /etc/postgresql/12/main/postgresql.conf
RUN  /etc/init.d/postgresql start &&\
    sudo -u postgres psql --command "CREATE USER odoo CREATEDB;"
    
    #Insstall Odoo
RUN apt-get -y install git &&\
    su - odoo &&\
    cd /home/odoo &&\
    su - odoo -c "git clone https://github.com/Odoo/odoo.git --depth 1 --branch 14.0 --single-branch odoo" &&\
    exit

    # Install some dependencies and wkhtmltopdf
RUN apt-get install -y git python3-pip \
     libxml2-dev \
     libxslt-dev \
     libevent-dev \
     libsasl2-dev \
     libldap2-dev \
     libjpeg-dev \
     zlib1g-dev \
     libpq-dev \
     fontconfig\
     libfreetype6\
     libpng16-16\
     libxrender1\
     xfonts-75dpi\
     xfonts-base &&\
    pip3 install -r /home/odoo/odoo/requirements.txt &&\
    wget "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb" &&\
    dpkg -i wkhtmltox_0.12.5-1.buster_amd64.deb &&\
    rm /etc/postgresql/12/main/pg_hba.conf &&\
    su odoo &&\
    cp /home/odoo/odoo/debian/odoo.conf /home/odoo/

    #Import odoo configuration file
COPY odoo.conf /home/odoo/

    #Import Postgres configuration file
COPY pg_hba.conf /etc/postgresql/12/main/

    #Import odoo service file
COPY odoo.service /etc/systemd/system/
   
    #Enable Odoo service on Boot 
#RUN systemctl enable /etc/systemd/system/odoo.service

    #Changanging owner of some files
RUN sudo chown odoo:1000 /home/odoo/odoo.conf &&\
    sudo chown postgres:104 /etc/postgresql/12/main/pg_hba.conf &&\
    sudo chown odoo:1000 /etc/systemd/system/odoo.service &&\
    exit

EXPOSE 8069 8071 8072

#Default user when start
USER odoo
CMD ["/bin/bash"]
