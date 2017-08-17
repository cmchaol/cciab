
# FROM busybox
FROM gentoo/stage3-amd64-hardened

RUN \
    lsmod >> /root/info ; \
    mount  >> /root/info ; \
    free -m >> /root/info ; \
    df -m >> /root/info
