FROM yl-base

RUN mkdir -p /srv/java
# Install Oracle JDK 8u74
RUN cd /tmp && \
    curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz" && \
    tar xf jdk-8u74-linux-x64.tar.gz -C /srv/java && \
    rm -f jdk-8u74-linux-x64.tar.gz && \
    ln -s /srv/java/jdk* /srv/java/jdk && \
    ln -s /srv/java/jdk /srv/java/jvm

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /srv/java/jdk

# Add /srv/java and jdk on PATH variable
ENV PATH ${PATH}:${JAVA_HOME}/bin:/srv/java
