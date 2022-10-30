From centos:latest

# 配置alias
RUN sed -i '$aalias ll="ls -l"' /root/.bashrc


# 添加youtube-dl可执行文件
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl


# 安装python
# RUN yum clean all && yum makecache && yum install -y  python39  && ln -s /usr/bin/python3 /usr/local/bin/python
COPY chkconfig-1.19.1-1.el8.x86_64.rpm /usr/local/src/
COPY python39-pip-wheel-20.2.4-6.module_el8.5.0+897+68c4c210.noarch.rpm /usr/local/src/
COPY python39-setuptools-wheel-50.3.2-4.module_el8.5.0+897+68c4c210.noarch.rpm /usr/local/src/
COPY python39-libs-3.9.6-2.module_el8.5.0+897+68c4c210.x86_64.rpm /usr/local/src/
COPY python39-3.9.6-2.module_el8.5.0+897+68c4c210.x86_64.rpm /usr/local/src/
# RUN  cd /usr/local/src/  && rpm -ivh --force *
RUN rpm -ivh --force /usr/local/src/*
RUN ln -s /usr/bin/python3 /usr/local/bin/python

# 下载
RUN mkdir /root/123
WORKDIR /root/123
# 下载--单个文件
# RUN  ["youtube-dl", "https://www.youtube.com/watch?v=-A-SYwDaksg"]   #这种写法将视频链接写死在Dockerfile中了，推荐使用下面的方法将视频链接单独提取到一个文件videos-list.txt中
RUN  ["youtube-dl",'-o','"linux-video-三立"',"https://www.youtube.com/watch?v=KeMlcV_Cf_k"]

#下载--多个文件
# COPY videos-list.txt /root/123/
# RUN ["youtube-dl", "-a","videos-list.txt"]

# CMD   （这一条不写应该也行）
CMD [ "sleep", "5000" ]
