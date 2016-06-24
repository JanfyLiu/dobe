#### 依赖要求
- 下载[Docker ToolBox](https://www.docker.com/docker-toolbox)
- 克隆[dobe](https://github.com/JanfyLiu/dobe)

#### 环境配置
- 工作目录设置，修改dobe文件夹docker-compose.yml文件volumes的~/work为你自己的工作目录
- 配置service-hosts
```sh
# 在dobe目录执行
docker-machine scp ./conf/hosts default:/tmp/hosts
# 在 docker-machine 内执行
sudo chmod og+w /etc/hosts
sudo cat /tmp/hosts >> /etc/hosts

```

#### 单元测试
- 在VirtualBox添加共享私有文件夹，右键点击虚拟主机 -> 设置 -> 共享文件夹 -> 添加共享文件夹，共享路径：/private/var/folders，文件夹名：private_folders
- 然后在虚拟主机执行命令
```sh
# 进入虚拟机
docker-machine ssh default
sudo mkdir -p /private/var/folders && sudo mount -t vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` private_folders /private/var/folders && exit
```

#### 构建项目
```sh
# 进入环境目录
cd dobe
# 设置连接docker环境变量
eval $(docker-machine env)
# 拉取docker国内镜像
make pull
# 安装镜像
make install
#启动容器
make up

# 启动api服务 路径有错请修改makefile对应为自己的目录
make api
# 启动api-proxy服务
make api-proxy
# 启动web服务
make web
```
