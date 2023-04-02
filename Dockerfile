FROM node:16.20.0-bullseye-slim
ENV NODE_ENV=production
ENV TIMEZONE=Europe/Berlin
RUN apt-get update && apt-get upgrade -y && apt-get install -y tzdata bash curl && \
    rm -rf /var/lib/apt/lists/* && \
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm install
EXPOSE 8080
CMD ["node", "index.js"]