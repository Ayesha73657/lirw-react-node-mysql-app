# Stage 1: Build React application
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Nginx
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]