FROM debian:bookworm-slim

RUN apt-get update -y \
    && apt-get install -y reprepro python3

# Create a non-root user to run the ./tools/publish script.
RUN adduser user

USER user
WORKDIR /home/user/apt-tools-prod
VOLUME /home/user/apt-tools-prod
