# Create image suitable to build aafu webmaker RPM

While the [aafu](https://github.com/aphecetche/aafu) builds fine on macos or linux, the generation of the RPM of its `webmaker` component needed to do some reporting on SAF can only be done on a Linux machine (and currently a SLC6-like one).

This image solves this problem by creating a suitable development environment for `webmaker`.

The image contains everything but the `aafu` code itself.

So to generate a RPM, the recipe is :

```
docker run -it --rm webmaker bash # start a container
source scl_source enable python27  # alibuild needs python >= 2.7
alienv -w /root/alice/sw enter ROOT/latest-release # aafu needs Root
git clone https://github.com/aphecetche/aafu # clone the code
cd aafu 
vim Makefile # to change the rpm version to be produced
make rpm 
```
