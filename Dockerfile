FROM alpine
LABEL author="mmiw3"

RUN apk add openssl

COPY ./encript.sh /bin/encrypt.sh

CMD ["/bin/sh", "/bin/encrypt.sh"]
