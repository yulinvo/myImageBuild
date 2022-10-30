From centos:latest

# 配置alias
# RUN  export alias ll="ls -l"
RUN sed -i '$aalias ll="ls -l"' /root/.bashrc


# 添加youtube-dl可执行文件
# COPY /usr/local/bin/youtube-dl  /usr/local/bin/            # 使用绝对路径一直失败，构建文件好像一定要放到和Dockerfile同目录    
# COPY ["/usr/local/bin/youtube-dl" "/usr/local/bin/"]
COPY youtube-dl /usr/local/bin/

# 安装python
RUN rm -f /etc/yum.repos.d/*
COPY CentOS-Base.repo /etc/yum.repos.d/
RUN yum clean all && yum makecache && yum install -y  python39  && ln -s /usr/bin/python3 /usr/local/bin/python


# CMD ["youtube-dl" "https://www.youtube.com/watch?v=-A-SYwDaksg"]

# CMD [ "sleep 5000" ]                #这种是将"sleep 5000"当作了执行器。 报错：starting container process caused: exec: "sleep 5000": executable file not found in $PATH: unknown
# CMD [ "/bin/sh", "-c", "sleep 5000" ]
CMD [ "sleep", "5000" ]
