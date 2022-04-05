FROM sharelatex/sharelatex

ENV DEBIAN_FRONTEND=noninteractive

ARG MIRROR

RUN apt-get update -qq && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get install --no-install-recommends -y fontconfig ttf-mscorefonts-installer && \
    if [[ ! -z "$MIRROR" ]] ; then tlmgr option repository "$MIRROR"; fi && \
    tlmgr update --self && \
    tlmgr install scheme-full && \
    fc-cache -f -v && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*
