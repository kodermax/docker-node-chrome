FROM node:10
LABEL name="node-chrome"

# Install Chrome

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt-get update -qqy \
	&& apt-get -qqy install xvfb google-chrome-stable python-dev
RUN wget -q -O /usr/bin/xvfb-chrome https://bitbucket.org/atlassian/docker-node-chrome-firefox/raw/ff180e2f16ea8639d4ca4a3abb0017ee23c2836c/scripts/xvfb-chrome

RUN ln -sf /usr/bin/xvfb-chrome /usr/bin/google-chrome

RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN chmod 755 /usr/bin/google-chrome

RUN python get-pip.py

RUN pip install awscli

# Log versions

RUN set -x \
    && node -v \
    && npm -v \
    && google-chrome --version
