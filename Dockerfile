FROM ubuntu:trusty

RUN apt-get -qq update && \
    apt-get -qq install -y git-core subversion build-essential gcc-multilib ccache quilt \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev && \
    apt-get clean && \
    useradd -m openwrt && \
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
USER openwrt
WORKDIR /home/openwrt/openwrt
RUN git clone git://git.openwrt.org/15.05/openwrt.git
RUN openwrt/scripts/feeds update && rm -rf tmp
