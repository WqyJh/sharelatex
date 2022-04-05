ARG BASE_TAG=sharelatex/sharelatex
FROM $BASE_TAG

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get install --no-install-recommends -y fontconfig ttf-mscorefonts-installer

RUN tlmgr option repository "$TEXLIVE_MIRROR" && \
    tlmgr update --self && \
    tlmgr install scheme-full && \
    fc-cache -f -v && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*
