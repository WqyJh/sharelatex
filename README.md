# sharelatex with texlive-full

## Run

```bash
docker-compose up -d
```

Then navigate to http://localhost:8080.

You can also reverse proxy it with nginx or caddy to support https.

## Build Image

```bash
docker build . -t wqyjh/sharelatex:texlive-full
```

Or build with mirror to accelerate the process

```bash
docker build . --build-arg MIRROR=https://mirrors.bfsu.edu.cn/CTAN/systems/texlive/tlnet -t wqyjh/sharelatex:texlive-full
```
