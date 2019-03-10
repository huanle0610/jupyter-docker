FROM jupyter/scipy-notebook:17aba6048f44

USER root

ADD pyAudioAnalysis /git-code

COPY sources.list /etc/apt/sources.list
COPY pip.conf /etc/pip.conf

# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
RUN apt-get update && \
    apt-get -y install man-db libmagic-dev && \
    rm -r /var/lib/apt/lists/*

USER $NB_UID

RUN pip install bash_kernel numpy matplotlib scipy sklearn hmmlearn simplejson eyed3 pydub librosa; \
    python -m bash_kernel.install; \
    pip install /git-code

