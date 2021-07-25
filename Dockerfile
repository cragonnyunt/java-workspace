FROM cragonnyunt/development-docker:latest

ARG JAVA_VERSION=11
ARG MAVEN_VERSION=3.8.1
ARG GRADLE_VERSION=7.1.1

RUN apt-get update && \
    apt-get install -y \
    openjdk-$JAVA_VERSION-jre-headless \
    openjdk-$JAVA_VERSION-jdk-headless

RUN curl -L -o apache-maven-$MAVEN_VERSION-bin.tar.gz https://downloads.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    tar -xzf apache-maven-$MAVEN_VERSION-bin.tar.gz -C /opt/ && \
    rm -rf apache-maven-$MAVEN_VERSION-bin.tar.gz

RUN curl -L -o gradle-$GRADLE_VERSION-bin.zip https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    7z x gradle-$GRADLE_VERSION-bin.zip -o/opt  && \
    rm -rf gradle-$GRADLE_VERSION-bin.zip

USER devuser

RUN echo "export PATH=\"\$MAVEN_HOME/bin:\$GRADLE_HOME/bin:\$PATH\"" >> ~/.zshrc

USER root

ENV JAVA_HOME /usr/lib/jvm/java-$JAVA_VERSION-openjdk-amd64/
ENV MAVEN_HOME /opt/apache-maven-$MAVEN_VERSION
ENV GRADLE_HOME /opt/gradle-$GRADLE_VERSION
