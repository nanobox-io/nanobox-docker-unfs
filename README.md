# UNFS (User-Space Network File System) ![Build Status Image](https://travis-ci.org/nanobox-io/nanobox-docker-unfs.svg)

This is an UNFS Docker image used to launch a UNFS service on Nanobox. To use this image, add a data component to your `boxfile.yml` with the `nanobox/unfs` image specified:

```yaml
data:
  image: nanobox/unfs
```

## UNFS Configuration Options

There are no configuration options unique to UNFS services, but they work in conjunction with network directories. These are covered in detail in the [Nanobox Network Storage documentation](https://docs.nanobox.io/app-config/network-storage/).

#### Example boxfile.yml with UNFS
```yaml
data.storage:
  image: nanobox/unfs

web:
  network_dirs:
    data.storage:
      - path/to/dirA
```

## Help & Support
This is a UNFS Docker image provided by [Nanobox](http://nanobox.io). If you need help with this image, you can reach out to us in the [#nanobox IRC channel](http://webchat.freenode.net/?channels=nanobox). If you are running into an issue with the image, feel free to [create a new issue on this project](https://github.com/nanobox-io/nanobox-docker-unfs/issues/new).

## License
Mozilla Public License, version 2.0
