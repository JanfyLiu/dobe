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
