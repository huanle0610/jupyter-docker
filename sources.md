```cmd
docker cp eb8d1022380e:/etc/apt/sources.list E:\docker\jupyter-docker\orig.list
```

```bash
amtf@LAPTOP-OMEJHUBF:/mnt/e/docker/jupyter-docker$ grep -e ^[^#] orig.list
deb http://archive.ubuntu.com/ubuntu/ bionic main restricted
deb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted
deb http://archive.ubuntu.com/ubuntu/ bionic universe
deb-src http://archive.ubuntu.com/ubuntu/ bionic universe
deb http://archive.ubuntu.com/ubuntu/ bionic-updates universe
deb-src http://archive.ubuntu.com/ubuntu/ bionic-updates universe
deb http://archive.ubuntu.com/ubuntu/ bionic multiverse
deb http://archive.ubuntu.com/ubuntu/ bionic-updates multiverse
deb http://archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ bionic-security main restricted
deb http://security.ubuntu.com/ubuntu/ bionic-security universe
deb-src http://security.ubuntu.com/ubuntu/ bionic-security universe
deb http://security.ubuntu.com/ubuntu/ bionic-security multiverse
```

```bash
$ grep -e ^[^#] orig.list | sed s/[a-z]*.ubuntu.com/mirrors.aliyun.com/g
```

```bash
grep -e ^[^#] orig.list | sed s/[a-z]*.ubuntu.com/mirrors.aliyun.com/g > sources.list
```