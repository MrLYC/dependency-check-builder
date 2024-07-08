ARG BASE_IMAGE=owasp/dependency-check:latest

FROM ${BASE_IMAGE} as BASE

COPY app /app

RUN /usr/share/dependency-check/bin/dependency-check.sh \
    --scan /app --format "ALL" --project "build" --out /tmp

FROM ${BASE_IMAGE} as TARGET

COPY --from=BASE /usr/share/dependency-check/data/odc.mv.db /usr/share/dependency-check/data/odc.mv.db