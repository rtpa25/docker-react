#builder is the phase and is useed to refere anything from this phase
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build ---> has everything we need after the builder phase is executed

#each block can have one FROM statement
#nginx is a simple web server which works to route our prod files to request on demand
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#nothing special to start nginx and once builder stuff is taken in the copy statement everything else is removed making stuff light, hence the prod build will not have any dependencies that we used while dev



