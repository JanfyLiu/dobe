#### DOBE使用
- 下载[Docker ToolBox](https://www.docker.com/docker-toolbox)
- 克隆[dobe](https://github.com/JanfyLiu/dobe)
- 修改dobe文件夹docker-compose.yml文件volumes的~/work为你自己的工作目录

#### 执行
```sh
cd dobe
eval $(docker-machine env)
docker-machine scp ./conf/hosts default:/tmp/hosts
make pull

# 在 docker-machine 内执行
sudo chmod og+w /etc/hosts
sudo cat /tmp/hosts >> /etc/hosts
sudo mkdir -p /private/var/folders && sudo mount -t vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` private_folders /private/var/folders && exit
# end

make install
make up

make api #启动api服务 路径有错请修改makefile对应目录
make api-proxy #启动api-proxy服务
make web #启动web服务

```
