# Create image suitable to build aafu webmaker RPM

While the [aafu](https://github.com/aphecetche/aafu) builds fine on macos or linux, the generation of the RPM of its `webmaker` component needed to do some reporting on SAF can only be done on a Linux machine (and currently a SLC6-like one).

This image solves this problem by creating a suitable development environment for `webmaker`.
