FROM debian:stable-20221004-slim

WORKDIR /

ARG LH_VERSION
ARG NETWORK
ARG BEACON_API_URL

RUN apt-get update && apt-get install -y curl expect

RUN version=$(echo $LH_VERSION | cut -d':' -f 2) \
&& curl -L https://github.com/sigp/lighthouse/releases/download/$version/lighthouse-$version-x86_64-unknown-linux-gnu.tar.gz --output lh.gz

RUN tar -xvf lh.gz

COPY validator-exit.sh .

RUN chmod +x validator-exit.sh

ENV VAL_NETWORK=$NETWORK
ENV BEACON_API_URL=$BEACON_API_URL

CMD ["/bin/sh", "validator-exit.sh"]
