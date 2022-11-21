# FPF Tools APT packages LFS repo

This repository holds packages served on `packages.freedom.press`.
Currently, this includes [Dangerzone](https://dangerzone.rocks/).

## Prerequisites

- [git-lfs](https://git-lfs.github.com/) to store large files.
- A very recent (>= 5.4) version of
  [reprepro](https://salsa.debian.org/brlink/reprepro), for
  multiple-version support. Tested by building from source in Debian
  experimental. To install from source, try [this
  repo](https://github.com/ionos-cloud/repreprohttps://github.com/ionos-cloud/reprepro).
- `zstd`, for newer Ubuntu distributions and future Debian distributions
  (this has not been throughly tested yet).

## Usage

- Set up a machine with the GPG key used for signing Release files.

- Commit new package files to each suite in `dangerzone`. You may want to
  prune older versions as new ones are released, to keep the repo
  manageable.

- Run `./tools/publish`, commit the results, and create a PR.

When PRs are merged, `packages.freedom.press` will pull new files and
serve the contents of `repo/public`.

## TODO

Since installing reprepro currently requires building it or running
Debian unstable, we will containerize it in the near future. This will
require communicating with GPG on the host or injecting the key, though.
