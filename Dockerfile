FROM node:10
LABEL name="node-chrome"

# Install Chrome

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt-get update -qqy \
	&& apt-get -qqy install google-chrome-stable python-dev
	
RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN python get-pip.py

RUN pip install awscli

# Log versions

RUN set -x \
    && node -v \
    && npm -v \
    && google-chrome --version
