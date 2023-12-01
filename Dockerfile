FROM python:3.12-slim
LABEL org.opencontainers.image.source https://github.com/StephenKing/terraform-iam-policy-validator-action

WORKDIR /action/workspace

RUN python3 -m pip install --no-cache-dir tf-policy-validator

ENTRYPOINT ["tf-policy-validator"]
#, "validate", "validate", "--template-path"]
