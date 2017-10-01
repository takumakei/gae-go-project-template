FROM golang:1.8.3-alpine3.6
ENV CLOUD_SDK_VERSION 173.0.0

ENV PATH /google-cloud-sdk/bin:$PATH

WORKDIR /
RUN apk update && \
    apk --no-cache add \
        curl \
        python \
        py-crcmod \
        bash \
        libc6-compat \
        openssh-client \
        git \
        gcc \
        libc-dev \
        libc6-compat \
        make
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    yes | gcloud components install app-engine-go

VOLUME ["/root/.config"]
