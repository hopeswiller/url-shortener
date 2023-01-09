FROM node:lts-alpine as buildStage
LABEL author="hopeswiller_<davidba941@gmail.com>"
LABEL version="0.1.0"
LABEL name="url-shortener"

# ENV NODE_ENV=production
WORKDIR /app

COPY package*.json ./

RUN npm install
COPY . .

# build app for production with minification
RUN npm run build


# production stage
FROM nginx:stable-alpine as release
WORKDIR /app
COPY --from=buildStage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]