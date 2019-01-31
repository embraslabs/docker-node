FROM node:10.15-slim as node
LABEL maintainer "Embras Labs <labs@embras.net>"

EXPOSE 4200
WORKDIR /app

RUN yarn global add @angular/cli@7.3.0

# Reference: https://github.com/jfroom/docker-compose-rails-selenium-example
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
RUN chmod +x /docker-entrypoint.sh
