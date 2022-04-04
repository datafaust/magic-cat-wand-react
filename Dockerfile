FROM node:alpine
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm config set unsafe-perm true
RUN chown -R node:node /node_modules
RUN npm i
CMD ["npm", "run", "start"]