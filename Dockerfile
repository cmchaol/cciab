
# FROM busybox
FROM gentoo/stage3-amd64-hardened

RUN \
    mkdir /usr/portage /dev/tmp; \
    chown portage:portage /dev/tmp; \
    ls -lha /dev/tmp >> /root/info; \
    echo PORTAGE_TMPDIR=\"/dev/tmp\" >> /etc/portage/make.conf; \
    free -m >> /root/info ; \
    echo "root" >> /root/info; dd if=/dev/zero of=/output bs=8k count=10k 2>> /root/info; rm -f /output; \
    echo "/dev" >> /root/info; \
    dd if=/dev/zero of=/dev/output bs=8k count=10k 2>> /root/info; rm -f /dev/output; \
    emerge-webrsync; \
    emerge net-misc/proxychains; \
    df -m >> /root/info
