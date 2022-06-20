FROM python:3.10

## Working directory for the application
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


# Install requirements
RUN apt-get update -y ### && apt-get install -y vim git traceroute


# Get the latest purge code
#RUN git clone -b master https://github.com/Kneckter/SpawnpointClusterTool.git .

RUN pip3 install -U geopy==1.20.0 PyMySQL==0.9.3 ### configargparse==0.14.0 peewee==3.9.6 matplotlib==3.1.1 PyMySQL==0.9.3 geopy==1.20.0 s2sphere==0.2.5 requests==2.27.1

## copy our configuration files in
COPY ./ /usr/src/app/

# Set Entrypoint with hard-coded options
#ENTRYPOINT ["ping","8.8.8.8"]
ENTRYPOINT ["python","cluster.py"]
