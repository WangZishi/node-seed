FROM node:5.2.0
MAINTAINER Wang Zishi "ynh.2@outlook.com"
LABEL version=0.1.0
COPY ["oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm", "oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm", "/root/"]
VOLUME ["/var/app"]
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "rpm"]
RUN ["apt-get", "install", "-y", "alien"]
RUN ["apt-get", "install", "-y", "libaio1"]
WORKDIR /root/
RUN ["alien", "--install", "oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm"]
RUN ["alien", "--install", "oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm"]
RUN ["npm", "install", "-g", "npm"]
RUN ["npm", "install", "-g", "node-gyp"]
RUN ["mkdir", ".node_modules"]
WORKDIR /root/.node_modules/
RUN ["npm", "install", "oracledb"]
RUN ["mv", "./node_modules/oracledb", "./"]
# ENV LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
CMD ["/bin/bash"]