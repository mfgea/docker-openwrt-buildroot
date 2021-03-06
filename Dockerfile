FROM ubuntu:trusty

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq git-core subversion build-essential gcc-multilib ccache quilt \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev
RUN apt-get clean
RUN useradd -m openwrt
RUN echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
RUN chown -R openwrt:openwrt /home/openwrt

USER openwrt
WORKDIR /home/openwrt
RUN git clone -b chaos_calmer https://github.com/openwrt/openwrt.git
WORKDIR /home/openwrt/openwrt
RUN ./scripts/feeds update
RUN rm -rf tmp
