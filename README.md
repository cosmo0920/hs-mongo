HS-Mongo
======

[![Build Status](https://travis-ci.org/cosmo0920/hs-mongo.png?branch=master)](https://travis-ci.org/cosmo0920/hs-mongo)

The source code for Database.MongoDB.

Simple CRUD (now partial), and some test code.

And you have to install MongoDB Server like this (when Ubuntu):

```bash
$ sudo apt-get install mongodb-server
```

## Try it

If you install cabal packages, __strongly recommended__ use cabal-dev.

### git clone

```bash
$ git clone https://github.com/cosmo0920/hs-mongo.git
$ cd hs-mongo
```

### Install dependent libraries

when you use __Debian and related distributions...__

```bash
$ cabal update
$ cabal install cabal-dev
$ ~/.cabal/bin/cabal-dev install --dry-run --only-dependencies #prevent dependency hell
$ ~/.cabal/bin/cabal-dev install --only-dependencies [--enable-tests] #if you execute hspec tests, add --enable-tests
```

### build application

```bash
$ ~/.cabal/bin/cabal-dev configure [--enable-tests] #if you execute hspec tests, add --enable-tests
$ ~/.cabal/bin/cabal-dev build
$ cp mongo-dummy.json mongo.json
[$ cp tests/mongo-dummy.json tests/mongo.json]
```

* * * *

This code is provided under the MIT LICENSE. see: [LICENSE](LICENSE)
