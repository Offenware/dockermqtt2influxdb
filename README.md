# dockermqtt2influxdb

sudo apt install gnupg2 pass
docker image build -t tagelus/dockermqtt2influxdb:latest  .
docker login -u tagelus
docker image push tagelus/dockermqtt2influxdb:latest

docker run tagelus/dockermqtt2influxdb

docker exec -it dockermqtt2influxdb /bin/sh

docker push offenware/dockermqtt2influxdb:latest

# ~/dockermqtt2influxdb/build.sh;docker rm -f $(docker ps | grep mqtt2influxdb | cut -d' ' -f1);cd /var/docker-compose;docker-compose up -d mqtt2influxdb;docker logs -f $(docker ps | grep mqtt2influxdb | cut -d' ' -f1)