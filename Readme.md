<p align="center">
    <img src="https://cdn2.iconfinder.com/data/icons/iconslandgps/PNG/256x256/Containers/ContainerRed.png" width=138/>
</p>

<h1 align="center">cppdev</h1>

> Bleeding-edge, state-of-the-art, latest and greatest, avant-garde,
> cutting-edge, pioneering, revolutionary, groundbreaking, innovative,
> forward-thinking, trailblazing, visionary, leading-edge, next-gen, futuristic,
> experimental, inventive, ingenious, novel, fresh, modern, advanced, high-tech,
> sophisticated, refined, evolved, progressive, dynamic, disruptive,
> unconventional, out-of-the-box, unorthodox, game-changing, paradigm-shifting,
> transformative, evolutionary, newfangled, modernistic, ultramodern,
> contemporary, hip, trendy, fashionable and blazingly fast C++2x toolchain and
> environment 🧙.
>
> - <cite>Literally me</cite>

<div align="center">
    <a href="https://hub.docker.com/r/nsbboamfh/cppdev" target="_blank">
    <img src="https://img.shields.io/docker/v/tomcat0x42/cppdev"></a>
    <a href="https://github.com/Tomcat-42/cppdev" target="_blank">
    <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Tomcat-42/cppdev?style=social">
</div>

## Installation

This container is available on
[Docker Hub](https://hub.docker.com/r/tomcat0x42/cppdev).

For installing it:

```bash
docker pull tomcat0x42/cppdev
```

## Usage example

You can use this container as a multi-stage build as follows:

```dockerfile
FROM cppdev:latest AS builder

USER cppdev
WORKDIR /home/cppdev/app

COPY --chmod=0755 --chown=cppdev:cppdev . ./

# build deps
RUN xrepo install -y fmt cxxopts gtest benchmark tabulate
RUN xmake build -y

FROM ubuntu:23.04 AS runner

WORKDIR /app

# runtime deps
RUN apt-get update && apt-get install -y \
    libssl3 \
    mawk \
    && rm -rf /var/lib/apt/lists/*


COPY --from=builder \
    /home/cppdev/app/build \
    ./
```

## CI/CD

This repo uses [Github Actions](https://docs.github.com/en/actions) for
automation of the modification => publishing cycle.
