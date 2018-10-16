FROM danielwhatmuff/alpine-glibc-docker

LABEL name="openshift"
LABEL version="1.0.0"
LABEL repository="http://github.com/jbjonesjr/openshift-oc-docker"
LABEL homepage="http://github.com/jbjonesjr/openshift-oc-docker"

LABEL maintainer="Jamie Jones <jbjonesjr@github.com>"
LABEL com.github.actions.name="GitHub Action for OpenShift"
LABEL com.github.actions.description="Wraps the oc CLI to enable common OpenShift commands."
LABEL com.github.actions.icon="box"
LABEL com.github.actions.color="green"
# COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

MAINTAINER "Jamie Jones" <jbjonesjr@github.com>

ENV OS_CLI_VERSION v3.11.0
ENV OS_TAG 0cbc58b

RUN apk-install curl ca-certificates && \
    curl -s -L https://github.com/openshift/origin/releases/download/${OS_CLI_VERSION}/openshift-origin-client-tools-${OS_CLI_VERSION}-${OS_TAG}-linux-64bit.tar.gz -o /tmp/oc.tar.gz && \
    tar zxvf /tmp/oc.tar.gz -C /tmp/ && \ 
    mv /tmp/openshift-origin-client-tools-${OS_CLI_VERSION}-${OS_TAG}-linux-64bit/oc /usr/bin/ && \
    rm -rf /tmp/oc.tar.gz /tmp/openshift-origin-client-tools-${OS_CLI_VERSION}-${OS_TAG}-linux-64bit/ && \
    rm -rf /root/.cache /var/cache/apk/ && \
    oc version

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
