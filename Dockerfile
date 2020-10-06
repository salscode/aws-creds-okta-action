FROM python:3.8-slim as base

FROM base as builder

RUN mkdir /install
WORKDIR /install

RUN pip install --prefix=/install --no-cache-dir --no-warn-script-location git+ssh://git@github.com/salscode/tokendito.git mintotp

FROM base
COPY --from=builder /install /usr/local

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
