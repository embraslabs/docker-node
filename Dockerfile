FROM node:16.13-slim as node
LABEL maintainer "Embras Labs <labs@embras.net>"

EXPOSE 4200
WORKDIR /app

# https://gist.github.com/LayZeeDK/c822cc812f75bb07b7c55d07ba2719b3
RUN yarn global add @angular/cli@13.0.2

# Reference: https://github.com/jfroom/docker-compose-rails-selenium-example
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
RUN chmod +x /docker-entrypoint.sh
