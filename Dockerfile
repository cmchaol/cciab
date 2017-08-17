
FROM busybox

RUN \
    lsmod >> /root/info && \
    mount  >> /root/info && \
    free -m >> /root/info && \
    mount -o size=1g -t tmpfs tmpfs && \
    mount >> /root/info && \
    free -m  >> /root/info
