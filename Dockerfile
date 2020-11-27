FROM archlinux:base-20201123.0.9844

# Create user
USER root
RUN pacman -Sy --noconfirm sudo
RUN useradd --create-home user
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Configure user
USER user
WORKDIR /home/user

## Install yay
RUN sudo pacman -S --needed --noconfirm git base-devel go
RUN git clone https://aur.archlinux.org/yay.git
RUN cd /home/user/yay && \
    makepkg -si --noconfirm
