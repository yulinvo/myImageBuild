From centos:latest

# 配置alias
RUN sed -i '$aalias ll="ls -l"' /root/.bashrc


# 添加youtube-dl可执行文件
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl


# 安装python
RUN yum install -y  python39  && ln -s /usr/bin/python3 /usr/local/bin/python

# 下载
RUN  ["youtube-dl", "https://www.youtube.com/watch?v=-A-SYwDaksg"]

# CMD
CMD [ "sleep", "5000" ]
