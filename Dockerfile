# Version: 0.0.1
FROM node:5.2.0
MAINTAINER Wang Zishi "ynh.2@outlook.com"
# COPY
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "rpm"]
CMD ["/bin/bash"]