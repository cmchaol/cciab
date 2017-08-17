
# FROM busybox
FROM gentoo/stage3-amd64-hardened

RUN \
    mkdir /usr/portage /var/tmp/portage /sys/firmware/portage; \
    chown portage:portage /sys/firmware/portage; \
    ln -s /sys/firmware/portage /var/tmp/portage; \
    ls -lha /var/tmp/portage 2>> /root/info; \
    lsmod >> /root/info ; \
    mount  >> /root/info ; \
    free -m >> /root/info ; \
    df -m >> /root/info ; \
    echo "root" >> /root/info; dd if=/dev/zero of=/output bs=8k count=10k 2>> /root/info; rm -f /output; \
    echo "/sys/firmware" >> /root/info; \
    dd if=/dev/zero of=/sys/firmware/output bs=8k count=10k 2>> /root/info; rm -f /sys/firmware/output
