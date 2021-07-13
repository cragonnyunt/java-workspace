# Java Workspace

[![Java Workspace CI](https://github.com/cragonnyunt/java-workspace/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/cragonnyunt/java-workspace/actions/workflows/main.yml)

Java Workspace Docker is built on top of the [development workspace docker](https://github.com/cragonnyunt/development-workspace). It contains the most used tools for Java developers, and prepare environment configuration for developing java apps and websites.

Set of tools installed
- Everything installed on [development workspace docker](https://github.com/cragonnyunt/development-workspace)
- Java (8 and 11)
- Maven
- Gradle
- Apache Ant

## Pulling the image

```
docker pull cragonnyunt/java-workspace-docker:<<tag>>
```

## Running the image

```
docker run --rm -it \
    -v $(pwd):/workspace \
    cragonnyunt/java-workspace-docker:<<tag>>
```
