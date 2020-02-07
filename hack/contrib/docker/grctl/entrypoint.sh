#!/bin/bash
if [ "$1" = "bash" ];then
    exec /bin/bash
elif [ "$1" = "version" ];then
    echo "$RELEASE_DESC"
elif [ "$1" = "install" ];then
    cp -a /run/rainbond-grctl /rootfs/path
    mkdir -p /rootfs/root/.rbd
    cp -a /etc/goodrain/region.goodrain.me/ssl/ca.pem /ssl/ca.pem
    cp -a /etc/goodrain/region.goodrain.me/ssl/client.pem /ssl/client.pem
    cp -a /etc/goodrain/region.goodrain.me/ssl/client.key.pem /ssl/client.key.pem
    cp -a /run/grctl.yaml /rootfs/root/.rbd/grctl.yaml
    exec /run/rainbond-grctl install
else
    exec /run/rainbond-grctl "$@"
fi