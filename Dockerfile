
# FROM busybox
FROM gentoo/stage3-amd64-hardened

RUN \
    mkdir /usr/portage /dev/portage; \
    chown portage:portage /dev/portage; \
    ls -lha /dev/portage >> /root/info; \
    ln -s /dev/portage /var/tmp; \
    chown portage:portage -h /var/tmp/portage; \
    ls -lha /var/tmp >> /root/info; \
    mount  >> /root/info ; \
    lsblk  >> /root/info ; \
    free -m >> /root/info ; \
    dd if=/dev/zero of=/root/swapfile1 bs=1024 count=524288; \
    chown root:root /root/swapfile1; \
    chmod 0600 /root/swapfile1; \
    mkswap /root/swapfile1; \
    swapon /root/swapfile1; \
    free -m >> /root/info ; \
    df -m >> /root/info ; \
    echo "root" >> /root/info; dd if=/dev/zero of=/output bs=8k count=10k 2>> /root/info; rm -f /output; \
    echo "/dev" >> /root/info; \
    dd if=/dev/zero of=/dev/output bs=8k count=10k 2>> /root/info; rm -f /dev/output; rm -f /root/swapfile1
