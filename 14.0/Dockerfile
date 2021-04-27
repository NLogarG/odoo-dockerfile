FROM jrei/systemd-debian  
RUN apt update && apt -y upgrade &&\
    apt install -y sudo &&\
    usermod -aG sudo root &&\
    adduser odoo &&\
    usermod -aG sudo odoo &&\
    export DEBIAN_FRONTEND=noninteractive && apt install -y postgresql
COPY pg_hba.conf /etc/postgresql/12/main/
RUN usermod -aG sudo postgres &&\
    su - postgres &&\
    pg_ctlcluster 11 main start &&\
    exit 
RUN echo "listen_addresses='*'" >> /etc/postgresql/12/main/postgresql.conf
RUN  /etc/init.d/postgresql start &&\
    sudo -u postgres psql --command "CREATE USER odoo CREATEDB;"
RUN exit  
RUN apt-get -y install git &&\
    su - odoo &&\
    cd /home/odoo &&\
    git clone https://github.com/Odoo/odoo.git --depth 1 --branch 14.0 --single-branch odoo &&\
    exit
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
    apt-get install -y wget &&\
    apt install -y nano &&\
    wget "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb" &&\
    dpkg -i wkhtmltox_0.12.5-1.buster_amd64.deb &&\
    rm /etc/postgresql/12/main/pg_hba.conf &&\
    su odoo &&\
    cp /home/odoo/odoo/debian/odoo.conf /home/odoo/
COPY odoo.conf /home/odoo/
COPY pg_hba.conf /etc/postgresql/12/main/
COPY odoo.service /etc/systemd/system/

EXPOSE 8069 8071 8072
