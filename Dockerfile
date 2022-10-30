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
RUN  ["youtube-dl", "https://www.youtube.com/watch?v=-A-SYwDaksg"]

# CMD
CMD [ "sleep", "5000" ]
