# FPF Tools APT packages LFS repo

This repository holds packages served on `packages.freedom.press`.
Currently, this includes [Dangerzone](https://dangerzone.rocks/).

## Prerequisites

- [git-lfs](https://git-lfs.github.com/) to store large files.
- [reprepro](https://salsa.debian.org/brlink/reprepro) to update the local
  Debian repo:
  * To install from source, try
    [this repo](https://github.com/ionos-cloud/reprepro).
  * Alternatively, build a container image using the `Dockerfile` in this repo:

    ```
    docker build -t apt-tools-prod-builder .
    ```

- `zstd`, for newer Ubuntu distributions and future Debian distributions
  (this has not been thoroughly tested yet).

## Usage

- Set up a machine with the GPG key used for signing Release files.

- Commit new package files to each suite in `dangerzone`. You may want to
  prune older versions as new ones are released, to keep the repo
  manageable.

- Run `./tools/publish`, to populate the Debian database.
  * You can run this part in a Docker container:

    ```
    docker run --rm -v .:/home/user/apt-tools-prod apt-tools-prod-builder ./tools/publish
    ```

- Run `./tools/publish --sign` to sign the release files. This part must run
  on an environment that has access to the private PGP key.
- Commit the results, and create a PR.

When PRs are merged, `packages.freedom.press` will pull new files and
serve the contents of `repo/public`.
