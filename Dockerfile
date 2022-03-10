FROM node:alpine3.14 as builder

ENV WORK_DIR /app

WORKDIR ${WORK_DIR}

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

ENV WORK_DIR /app

COPY --from=builder  ${WORK_DIR}/build /usr/share/nginx/html
