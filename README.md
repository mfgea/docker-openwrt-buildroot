docker-openwrt-buildroot
========================
[![Docker Build Status](http://hubstatus.container42.com/noonien/openwrt-buildroot)](https://registry.hub.docker.com/u/alljoynsville/openwrt-buildroot)
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/alljoynsville/docker-openwrt-buildroot/blob/master/LICENSE)


This is a docker container for the [OpenWRT](https://openwrt.org/)
[buildroot](http://wiki.openwrt.org/doc/howto/buildroot.exigence).

Because the build system requires that its command are not executed by root,
the user `openwrt` was created. The buildroot can be found in
`/home/openwrt/openwrt`.

To run a shell in the buildroot, execute the following command:

```sh
docker run -t -i -v $HOME/openwrt:/home/openwrt/openwrt mfgea/docker-openwrt-buildroot:nosource sudo -iu openwrt bash
```

This will not download source, but it will use a monted share for the buildroot ($HOME/openwrt)

More information on how to use this buildroot can be found on the
[OpenWRT wiki](http://wiki.openwrt.org/doc/howto/build).
