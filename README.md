= Abandoned =

Abandoning this work because deploying python / node often requires compiling
extensions/modules written in C. 

This causes several challenges that are not worth overcoming: 

- requires GCC to get all requirements, bloating the container and making it
  pointless
- using a build box is not good enough as modules link to shared libraries that
  will have to be replicated on the busybox container (paths/libraries/versions/etc)

= What is this? =

An abandoned project for building tiny docker base images for 

* python
* nodejs

Total work in progress
