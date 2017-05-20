FROM alpine:3.4
RUN apk update && apk upgrade && apk add nodejs 
RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories && \
apk add --no-cache yarn && rm -rf /var/cache/apk/*s


# set the working directory to our source root
WORKDIR /usr/app

# copy the package.json and yarn.lock file
COPY package.json /usr/app
COPY yarn.lock /usr/app

# install the dependencies
RUN yarn install

# copy source code
COPY . /usr/app
RUN cd /usr/app


# replace this with your application's default port
EXPOSE 8888

CMD [ "yarn" , "start" ]