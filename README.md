# sharelatex with texlive-full

Sharelatex with latest full version of texlive 2022. Image was built and updated every week by Github Action.

## Run

```bash
docker-compose up -d
```

Then navigate to http://localhost:8080.

You can also reverse proxy it with nginx or caddy to support https.

## Manually Build Image

```bash

export TEXLIVE_MIRROR=http://mirror.ctan.org/systems/texlive/tlnet

sed -i 's#ENV PATH.*texlive/2021.*#ENV PATH "${PATH}:/usr/local/texlive/2022/bin/x86_64-linux"#' overleaf/server-ce/Dockerfile-base

docker build -f overleaf/server-ce/Dockerfile-base \
--build-arg TEXLIVE_MIRROR=$TEXLIVE_MIRROR \
-t wqyjh/sharelatex:base \
overleaf/

docker build -f overleaf/server-ce/Dockerfile\
--build-arg SHARELATEX_BASE_TAG=wqyjh/sharelatex:base \
-t wqyjh/sharelatex:texlive \
overleaf/

docker build \
--build-arg BASE_TAG=wqyjh/sharelatex:texlive \
--build-arg TEXLIVE_MIRROR=$TEXLIVE_MIRROR \
-t wqyjh/sharelatex:texlive-full \
./
```

Or build with mirror to accelerate the process

```bash
docker build . --build-arg MIRROR=https://mirrors.bfsu.edu.cn/CTAN/systems/texlive/tlnet -t wqyjh/sharelatex:texlive-full
```
