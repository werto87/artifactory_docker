# Dockerfile
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean

# Download Artifactory OSS .deb
RUN wget https://releases.jfrog.io/artifactory/artifactory-debs/pool/jfrog-artifactory-cpp-ce/jfrog-artifactory-cpp-ce-7.63.12.deb

# Install Artifactory
RUN apt-get update && \
    apt-get install -y ./jfrog-artifactory-cpp-ce-7.63.12.deb  && \
    rm -f ./jfrog-artifactory-cpp-ce-7.63.12.deb

# Expose default Artifactory ports
EXPOSE 8081 8082

# Use a script to start Artifactory and keep container alive
CMD ["/opt/jfrog/artifactory/app/bin/artifactory.sh"]