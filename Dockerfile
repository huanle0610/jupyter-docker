FROM jupyter/scipy-notebook:17aba6048f44

USER root

COPY sources.list /etc/apt/sources.list

# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
# Reinstall all currently installed packages in order to get the man pages back
RUN apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    apt-get -y install man-db && \
    rm -r /var/lib/apt/lists/*

USER $NB_UID

RUN pip install bash_kernel; \
    python -m bash_kernel.install;

