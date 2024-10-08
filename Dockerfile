FROM node:22-alpine3.19 AS build
WORKDIR /src
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.27.2
COPY --from=build /src/dist /usr/share/nginx/html