FROM cragonnyunt/development-docker:latest

RUN apt-get update && \
    apt-get install -y \
    openjdk-8-jre-headless \
    openjdk-8-jdk-headless

RUN curl -L -o apache-maven-3.8.1-bin.tar.gz https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz && \
    tar -xzf apache-maven-3.8.1-bin.tar.gz -C /opt/ && \
    rm -rf apache-maven-3.8.1-bin.tar.gz

RUN curl -L -o gradle-7.1.1-bin.zip https://services.gradle.org/distributions/gradle-7.1.1-bin.zip && \
    7z x gradle-7.1.1-bin.zip -o/opt  && \
    rm -rf gradle-7.1.1-bin.zip

RUN curl -L -o apache-ant-1.10.10-bin.zip https://downloads.apache.org/ant/binaries/apache-ant-1.10.10-bin.zip && \
    7z x apache-ant-1.10.10-bin.zip -o/opt  && \
    rm -rf apache-ant-1.10.10-bin.zip

USER devuser

RUN echo "export PATH=\"\$MAVEN_HOME/bin:\$GRADLE_HOME/bin:\$ANT_HOME/bin:\$PATH\"" >> ~/.zshrc

USER root

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV MAVEN_HOME /opt/apache-maven-3.8.1
ENV GRADLE_HOME /opt/gradle-7.1.1
ENV ANT_HOME /opt/apache-ant-1.10.10
