###insrall base os
FROM node:alpine as builder

###Working DIRECTORY 
WORKDIR '/app'

###Install NPM
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

##COPY CONTENTS TO NGINX 
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
