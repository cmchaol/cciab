
FROM busybox

RUN \
    lsmod >> /root/info ; \
    mount  >> /root/info ; \
    free -m >> /root/info ; \
    df -m >> /root/info
