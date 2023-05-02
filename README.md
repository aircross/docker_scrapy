# Docker版的Scrapy快速部署环境

 使用docker快速部署你的scrapy项目

目的在于搭建Docker版的Scrapy快速部署环境，可以方便地运行在群辉之类的Docker容器中
[![](http://dockeri.co/image/aircross/docker_scrapy)](https://hub.docker.com/r/aircross/docker_scrapy)



# 功能介绍

## 服用方法

此 docker 教程与 docker 镜像由[https://vps.la](https://vps.la)提供

1. 安装docker
   
   ```shell
   curl -fsSL https://get.docker.com | sh
   ```
2. 安装
   
   ### 当前目录为执行目录，即项目存放目录
   
   ```shell
   # 下面的命令代表/opt/dokcer/scrapy作为项目目录
   # 将需要安装的包要求填入运行目录requirements.txt文件中
   mkdir /opt/dokcer && mkdir /opt/dokcer/scrapy && cd /opt/dokcer/scrapy
   docker run -itd --network=host \
    -v .:/app/ \
    --name docker_scrapy --restart=unless-stopped \
    aircross/docker_scrapy:latest
   ```
3. 使用
   
   ### 复制你的项目代码到宿主机的/opt/dokcer/scrapy
   
   ### 在宿主机运行一下命令进入到docker版的scrapy环境
   
   ```shell
   docker exec -it docker_scrapy /bin/bash
   ```
   
   ### 执行你爬虫项目
   ```shell
   cd scrapy_demo
   scrapy crawl spider_demo
   
   ```