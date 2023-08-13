FROM golang

RUN apt-get update && \
    apt install jq -y

WORKDIR /opt

RUN git clone https://github.com/protolambda/eth2-val-tools.git

WORKDIR /opt/eth2-val-tools

RUN go install

COPY generate-keys.sh .

ENTRYPOINT ./generate-keys.sh
