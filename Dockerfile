FROM  centos
MAINTAINER orange<745150670@qq.com>
COPY readme.txt /usr/local/readme.txt
ADD jdk-8u11-linux-x64.tar.gz /usr/local/
ADD apache-tomcat-9.0.50.tar.gz /usr/local/
ENV MYPATH /usr/local
WORKDIR $MYPATH
ENV JAVA_HOME /usr/local/jdk1.8.0_11
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.50
ENV CATALINA_BASH /usr/local/apache-tomcat-9.0.50
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin
EXPOSE 8080
CMD /usr/local/apache-tomcat-9.0.50/bin/startup.sh && tail -F /usr/local/apache-tomcat-9.0.50/bin/logs/catalina.out
