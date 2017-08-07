
FROM busybox

RUN cat /proc/cpuinfo >> /root/cpuinfo
