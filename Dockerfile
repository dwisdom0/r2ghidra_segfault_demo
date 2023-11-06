FROM bitnami/minideb:bookworm

COPY cp.gz /root/cp.gz

RUN \
  apt update && \
  apt install -y git make gcc g++ curl pkg-config zip && \
  git clone https://github.com/radareorg/radare2 && \
  radare2/sys/install.sh && \
  r2pm -U && \
  r2pm -ci r2ghidra && \
  gunzip /root/cp.gz

ENTRYPOINT /bin/sh
