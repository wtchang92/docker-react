FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Use as to decalre more blocks if not the last block
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# Default container command runs nginx