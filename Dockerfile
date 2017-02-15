FROM ubuntu:trusty

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq git-core subversion build-essential gcc-multilib ccache quilt \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev && \
    apt-get clean && \
    useradd -m openwrt && \
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
USER openwrt
RUN cd /home/openwrt && \
    git clone https://github.com/openwrt/openwrt.git && \
    cd openwrt && \
    openwrt/scripts/feeds update && \
    rm -rf tmp
WORKDIR /home/openwrt/openwrt
