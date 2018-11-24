FROM daihasso/healthcheck

ONBUILD COPY --from=build /app /app

ONBUILD COPY swagger.yaml /swagger.yaml

HEALTHCHECK --interval=30s --timeout=3s --retries=8 CMD ["/healthcheck"]

ENTRYPOINT ["/app"]
