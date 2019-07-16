FROM alpine:3.10.1

RUN apk update && \
    apk add --no-cache --virtual build-deps \ 
    wget \
    tar
RUN wget https://github.com/miguelmota/ipdr/releases/download/v0.1.5/ipdr_0.1.5_linux_386.tar.gz -O ipdr.tar.gz
RUN tar -xzf ipdr.tar.gz    && \
    rm ipdr.tar.gz          && \
    chmod a+x ipdr          && \
    mv ipdr /usr/local/bin/ && \
    apk del build-deps
EXPOSE 5000
ENTRYPOINT ["ipdr"]
CMD ["server"]