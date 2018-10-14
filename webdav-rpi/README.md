# WebDAV container

Thanks for **morrisjobke** who has built a popular Webdav docker for Ubuntu.
So I just slightly changed a bit just to fit in Raspberry Pi, and it worked so well. Refer to `morrisjobke/webdav` for more information.

## How to use

```sh
docker run -d --name webdav --restart always \
        -v ~/webdav:/var/webdav \
        -e USERNAME=ubuntu -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav-rpi
```
