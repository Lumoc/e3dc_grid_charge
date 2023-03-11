FROM node:alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm install
EXPOSE 8080
CMD ["node", "index.js"]