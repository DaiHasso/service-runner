FROM daihasso/healthcheck

ONBUILD ARG PACKAGE_NAME
ONBUILD ARG GITHASH
ONBUILD ARG SEMVER

ONBUILD LABEL org.label-schema.name=$PACKAGE_NAME \
              org.label-schema.vcs-ref=$GITHASH \
              org.label-schema.version=$SEMVER \
              org.label-schema.schema-version="1.0"

ONBUILD COPY --from=build /app /app

HEALTHCHECK --interval=30s --timeout=3s --retries=8 CMD ["/healthcheck"]

ENTRYPOINT ["/app"]
