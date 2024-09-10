FROM debian:12
WORKDIR /root
RUN apt-get update && \
    apt-get install openssl -y
COPY ./dist /root/app
RUN chmod -R +x /root/app
ENTRYPOINT [ "/root/app/zgs_node", "--config=/etc/zgs/config.yaml" ]
