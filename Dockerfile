FROM oraclelinux:8

LABEL maintainer="Nginx Docker Maintainers"

RUN yum install -y nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]