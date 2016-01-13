# Dobe
>一个夸平台的Docker PHP开发环境

#### Require
- [docker-toolbox](https://www.docker.com/docker-toolbox)

#### Install

```
mkdir ~/work \ #工作目录
      ~/work/data \ #数据目录
      ~/work/data/mysql \
      ~/work/data/elasticsearch \
      ~/work/log \ #日志目录
      ~/work/log/nginx
```
#### Build
```
docker-machine ssh default
curl -sSL https://get.daocloud.io/daomonit/install.sh | sh -s 433eaf4bd42e6fd80c3de4a1f9758b6b4d7afb1f
make pull
make dl
docker-compose build
```
#### Run
```
docker-compose up -d
```
#### hosts
```
sudo echo "192.168.99.100 localhost docker" >> /etc/hosts
```
