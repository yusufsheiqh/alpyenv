FROM alpine:latest

ARG PYTHON_VERSIONS="3.7 3.8 3.9 3.10 3.11"

ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

RUN apk update && apk add --no-cache \
      bash \
      bzip2-dev \
      gcc \
      git \
      libc-dev \
      libffi-dev \
      make \
      openssl-dev \
      readline-dev \
      sqlite-dev \
      xz-dev \
      zlib-dev \
    && git clone --depth=1 https://github.com/pyenv/pyenv.git .pyenv \
    && pyenv install ${PYTHON_VERSIONS} \
    && pyenv global $(echo ${PYTHON_VERSIONS} | awk '{ print $NF }')
