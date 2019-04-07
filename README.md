# myss

将 ss 服务 Docker 化，方便快速搭建属于自己的 ss 服务器。

> PS：默认配置文件为多端口多用户，可根据需要增删端口和用户，或者改为单用户使用，具体配置可参考  [shadowsocks wiki](https://github.com/shadowsocks/shadowsocks/wiki)

## Sample

- 克隆本仓库到本地

  ```bash
  $ git clone https://github.com/shkey/myss.git
  ```

- 构建 Docker 镜像

  首先，你需要有 Docker 环境才能继续执行后面的步骤。先进入 myss 文件夹，再执行 Docker 构建镜像的命令

  ```bash
  $ cd myss
  $ docker build -t myss:v0.1.0 .
  ```

  > 别忘了上面命令最后的`.`

- 查看构建好的镜像

  ```bash
  $ docker images
  REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
  myss                 v0.1.0              9678d710bbf5        9 seconds ago       73.2MB
  ```

- 守护态运行容器

  ```bash
  $ docker run -itd -p 8765:8765 -p 4321:4321 -p 2333:2333 myss:v0.1.0
  f6a4ef5f92fa81f73c0cb73fe5f263564021a28d89be400b4576c43a3e733449
  ```

  > - 注意不要忘了加 `-p` 参数进行端口映射
  > - 可加上 `--restart=always` 参数让容器始终自动重启

- 查看运行的容器

  ```bash
  $ docker ps
  CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                                                    NAMES
  f6a4ef5f92fa        myss:v0.1.0         "ssserver -c /etc/sh…"   10 seconds ago      Up 9 seconds        0.0.0.0:2333->2333/tcp, 0.0.0.0:4321->4321/tcp, 0.0.0.0:8765->8765/tcp   cranky_jang
  ```
