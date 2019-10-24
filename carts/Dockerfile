FROM centos:7

RUN yum install -y epel-release java-1.8.0-openjdk-devel



ENTRYPOINT ["java","-jar","/app/carts/carts.jar","-Ddb:carts-db=carts-db", "--port=80"]