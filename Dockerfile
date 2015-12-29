FROM ubuntu:trusty

RUN apt-get update &&\
    apt-get install -y git-core subversion build-essential gcc-multilib \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python libssl-dev &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
RUN sudo -iu openwrt git clone git://git.openwrt.org/15.05/openwrt.git
RUN sudo -iu openwrt openwrt/scripts/feeds update
USER openwrt
WORKDIR /home/openwrt/openwrt
