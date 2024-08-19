FROM debian:bookworm
LABEL maintainer='david.williamson@varilink.co.uk'
ARG UID
ARG USER

RUN                                                                            \
  apt-get update                                                            && \
  apt-get --yes --no-install-recommends install                                \
    sudo                                                                    && \
  sed -i 's/^%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/'      \
    /etc/sudoers                                                            && \
  useradd --create-home --shell /bin/bash --uid ${UID} ${USER}              && \
  usermod -a -G sudo ${USER}

USER ${USER}
WORKDIR /home/${USER}
