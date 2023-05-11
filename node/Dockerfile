# Init base image
FROM node:latest
# Install git and clone repo
RUN apt update
RUN apt install -y git
RUN git clone https://github.com/vblaskovics/node-prom node-prom
# Init and run app
WORKDIR /node-prom
RUN npm install
EXPOSE 8080
CMD node server.js
