# GIT pull\push

## Supported tags

* latest: last version build

## Usage

Run git-pullpush

```sh
$ docker run -d \
    --name pullpush \
    -e URL=https://github.com/Telepuz/dots \
    -e TIMEOUT=300 \
    t7k312/pullpush
```

## docker-compose

```
version: '3.7'

services:

  git-pullpush:
    image: t7k312/pullpush
    environment:
      - SSH_KEY=-----BEGIN RSA PRIVATE KEY-----\nasgashHJhjkshhwASqjhljqHGL\njaahhiugUHIEHGThuaiugafgighausga...ghsiuaHGUI\n5xeGwwRPjLFzf6MucA+lKqVH7ZxJ3k15\n-----END RSA PRIVATE KEY-----
      - URL=https://github.com/Telepuz/dots
      - TIMEOUT=300
      - UID=1000
      - GID=1000
    volumes:
      - ./repo:/repo
    restart: unless-stopped
```

## Configuration

Environment Configuration:

* SSH_KEY  - SSH-key for repo access
* URL      - repo URL
* TIMEOUT  - update timeoutin seconds (defaul:300)
* REPO_DIR - local repo dir (default:/repo)
* UID      - User ID (default:1000)
* GID      - Group ID (default:1000)
