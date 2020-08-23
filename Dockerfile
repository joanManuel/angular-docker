### Stage 1: Build ###

FROM node:12.7-alpine AS Build
WORKDIR /app
COPY packe.json ./
RUN npm install
COPY . .
RUN npm run build --prod


### Stage 2: Run ###

FROM nginx:1.17.1-alpine AS prod-stage
COPY --from=build /app/dis/angular-docker /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
