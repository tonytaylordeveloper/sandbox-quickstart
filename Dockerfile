# base image
FROM  node
LABEL author="Tony Taylor"
EXPOSE 4200

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable
# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# add app
COPY . /usr/src/app

# start app


#RUN mkdir -p /var/www/html
#WORKDIR /var/www/html
#COPY . /var/www/html

#RUN npm i -g @angular/cli nodemon foreman && \
#    npm i && \
#    npm i -D webpack && \
#    npm audit fix --force && \
#    npm rebuild node-sass
CMD ng serve --host 0.0.0.0 --port 4200