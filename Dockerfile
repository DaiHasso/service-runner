FROM daihasso/healthcheck

ONBUILD COPY --from=build /app /app

HEALTHCHECK --interval=30s --timeout=3s --retries=8 CMD ["/healthcheck"]

ENTRYPOINT ["/app"]
