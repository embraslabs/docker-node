ARG _NODE_VERSION=16.18
ARG _ANGULAR_CLI_VERSION=14.2.9

FROM node:${_NODE_VERSION}  
LABEL maintainer "Embras Labs <labs@embras.net>"

ENV TZ=Etc/UTC
ENV LANG C.UTF-8

EXPOSE 4200
WORKDIR /app

# https://gist.github.com/LayZeeDK/c822cc812f75bb07b7c55d07ba2719b3
RUN yarn global add @angular/cli@${_ANGULAR_CLI_VERSION}

# Reference: https://github.com/jfroom/docker-compose-rails-selenium-example
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
RUN chmod +x /docker-entrypoint.sh
