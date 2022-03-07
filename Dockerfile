#builder is the phase and is useed to refere anything from this phase
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build ---> has everything we need after the builder phase is executed

#each block can have one FROM statement
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#nothing special to start nginx and once builder stuff is taken in the copy statement everything else is removed making stuff light



