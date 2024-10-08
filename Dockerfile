# Use the golang image with the 1.23-bookworm tag as the base
FROM golang:1.23-bookworm

# Prevent tzdata installation prompting for input
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install gradle
RUN apt-get update && \
	apt-get install -y openjdk-17-jre wget unzip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	wget https://services.gradle.org/distributions/gradle-7.6-bin.zip && \
	mkdir /opt/gradle && \
	unzip -d /opt/gradle gradle-7.6-bin.zip && \
	rm gradle-7.6-bin.zip

# Add gradle installation to PATH
ENV PATH="${PATH}:/opt/gradle/gradle-7.6/bin"
