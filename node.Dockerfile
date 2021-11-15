# Init base image
FROM ubuntu
# Install node
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
# Install git and clone repo
RUN apt update
RUN apt install -y git
RUN git clone https://github.com/vblaskovics/node-prom node-prom
# Init and run app
WORKDIR /node-prom
RUN npm install
EXPOSE 8080
CMD node serv
