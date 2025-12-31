FROM node:alpine

WORKDIR /usr/app

COPY certs/netskope-root-ca.crt /usr/local/share/ca-certificates/netskope-root-ca.crt
COPY certs/netskope-intermediate-ca.crt /usr/local/share/ca-certificates/netskope-intermediate-ca.crt

RUN ls -al /usr/local/share/ca-certificates

RUN apk add --no-cache --no-check-certificate ca-certificates
RUN update-ca-certificates

RUN npm config set cafile /etc/ssl/certs/ca-certificates.crt

COPY . .

RUN npm install

CMD ["npm", "start"]
