HS-Mongo
======

The source code for Database.MongoDB.

Simple CRUD (now partial), and some test code.

## Try it

If you install cabal packages, __strongly recommended__ use cabal-dev.

### git clone and prepare git submodule

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
$ ~/.cabal/bin/cabal-dev install --only-dependencies
```

### build application

```bash
$ ~/.cabal/bin/cabal-dev configure [--enable-tests] #if you execute hspec tests, add --enable-tests
$ ~/.cabal/bin/cabal-dev build
```

* * * *

This code is provided under the MIT LICENSE. see: [LICENSE](LICENSE)
