FROM ghcr.io/tensorchord/cloudnative-vectorchord:17-1.1.1

ARG CNPG_TAG=17
ARG PGVECTORS_TAG=v0.2.1
ARG TARGETARCH

USER root

# Téléchargement du .deb pgvecto.rs compatible
ADD https://github.com/tensorchord/pgvecto.rs/releases/download/${PGVECTORS_TAG}/vectors-pg${CNPG_TAG%.*}_${PGVECTORS_TAG#v}_${TARGETARCH}.deb /tmp/pgvectors.deb

# Installation du .deb
RUN apt-get update && \
    apt-get install -y /tmp/pgvectors.deb && \
    rm /tmp/pgvectors.deb

USER postgres
