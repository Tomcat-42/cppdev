FROM archlinux:latest

# Bleeding-edge, state-of-the-art, latest and greatest, avant-garde,
# cutting-edge, pioneering, revolutionary, groundbreaking, innovative,
# forward-thinking, trailblazing, visionary, leading-edge, next-gen,
# futuristic, experimental, inventive, ingenious, novel, fresh, modern,
# advanced, high-tech, sophisticated, refined, evolved, progressive,
# dynamic, disruptive, unconventional, out-of-the-box, unorthodox,
# game-changing, paradigm-shifting, transformative, evolutionary,
# newfangled, modernistic, ultramodern, contemporary, hip, trendy,
# and fashionable. C++2x toolchain and environment 🧙.
RUN pacman -Sy xmake clang cmake neovim zsh unzip git make --noconfirm &&\
    useradd -m -G wheel -s /bin/zsh cppdev

USER cppdev
WORKDIR /home/cppdev
