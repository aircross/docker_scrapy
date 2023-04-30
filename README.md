# Docker版的Scrapy快速部署环境
 使用docker快速部署你的scrapy项目

目的在于搭建Docker版的Scrapy快速部署环境，可以方便地运行在群辉之类的Docker容器中

# 功能介绍

## 服用方法
此 docker 教程与 docker 镜像由[https://vps.la](https://vps.la)提供
1. 安装docker
```shell
curl -fsSL https://get.docker.com | sh
```
2. 安装
```shell
mkdir /opt/dokcer && mkdir /opt/dokcer/scrapy && cd /opt/dokcer/scrapy
docker run -itd --network=host \
    -e PKG='pymysql' \
    -v .:/app/ \
    --name docker_scrapy --restart=always \
    aircross/docker_scrapy:latest
```
2. 使用
```
待补充
```