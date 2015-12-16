# Version: 0.0.1
FROM node:5.2.0
MAINTAINER Wang Zishi "ynh.2@outlook.com"
COPY ["oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm", "oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm", "/root/"]
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "rpm"]
RUN ["apt-get", "install", "-y", "alien"]
WORKDIR /root/
RUN ["alien", "--install", "oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm"]
RUN ["alien", "--install", "oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm"]
# ENV LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
CMD ["/bin/bash"]