FROM alpine:3.14.0
MAINTAINER vbakh <volodymyr1280@gmail.com>
LABEL owner="vbakh"
ENV PATH="/bin/:$PATH"

# Install python 3
ENV PYTHONUNBUFFERED=1
RUN apk update \
    && apk add bash \
    && apk add --update --no-cache python3 \
    && ln -sf python3 /usr/bin/python

# install setuptools and aws cli
RUN python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools \
    && pip3 install awscli

CMD ["/bin/bash"]
