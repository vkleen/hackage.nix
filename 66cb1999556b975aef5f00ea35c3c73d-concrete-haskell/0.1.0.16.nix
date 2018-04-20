{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "concrete-haskell";
          version = "0.1.0.16";
        };
        license = "LicenseRef-GPL";
        copyright = "2017";
        maintainer = "tom@cs.jhu.edu";
        author = "Thomas Lippincott";
        homepage = "https://github.com/hltcoe";
        url = "";
        synopsis = "Library for the Concrete data format.";
        description = "Concrete is a Thrift-based data specification designed for Natural Language Processing (NLP) applications.  This library provides a Haskell interface to code generated from the latest release of Concrete (the concrete-haskell-autogen package). It also has an ingest utility for converting various formats (JSON, CSV, XML, etc) to Concrete Communication objects.";
        buildType = "Simple";
      };
      components = {
        concrete-haskell = {
          depends  = [
            hsPkgs.QuickCheck
            hsPkgs.base
            hsPkgs.binary
            hsPkgs.bytestring
            hsPkgs.bzlib
            hsPkgs.bzlib-conduit
            hsPkgs.concrete-haskell-autogen
            hsPkgs.conduit
            hsPkgs.conduit-combinators
            hsPkgs.conduit-extra
            hsPkgs.containers
            hsPkgs.cryptohash-conduit
            hsPkgs.deepseq
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.hashable
            hsPkgs.lens
            hsPkgs.megaparsec
            hsPkgs.monad-extras
            hsPkgs.mtl
            hsPkgs.network
            hsPkgs.optparse-generic
            hsPkgs.path
            hsPkgs.path-io
            hsPkgs.process
            hsPkgs.scientific
            hsPkgs.stm
            hsPkgs.tar
            hsPkgs.tar-conduit
            hsPkgs.text
            hsPkgs.thrift
            hsPkgs.time
            hsPkgs.unordered-containers
            hsPkgs.uuid
            hsPkgs.vector
            hsPkgs.zip
            hsPkgs.zip-conduit
            hsPkgs.zlib
          ];
        };
        exes = {
          apply_annotators = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
          build_graphs = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
          fetch_service = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
          ingest_communications = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
          inspect_communications = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
          store_service = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
        };
        tests = {
          ingesters = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
          serialization = {
            depends  = [
              hsPkgs.QuickCheck
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.bzlib
              hsPkgs.bzlib-conduit
              hsPkgs.concrete-haskell
              hsPkgs.concrete-haskell-autogen
              hsPkgs.conduit
              hsPkgs.conduit-combinators
              hsPkgs.conduit-extra
              hsPkgs.containers
              hsPkgs.cryptohash-conduit
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.hashable
              hsPkgs.lens
              hsPkgs.megaparsec
              hsPkgs.monad-extras
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.optparse-generic
              hsPkgs.path
              hsPkgs.path-io
              hsPkgs.process
              hsPkgs.scientific
              hsPkgs.stm
              hsPkgs.tar
              hsPkgs.tar-conduit
              hsPkgs.text
              hsPkgs.thrift
              hsPkgs.time
              hsPkgs.unordered-containers
              hsPkgs.uuid
              hsPkgs.vector
              hsPkgs.zip
              hsPkgs.zip-conduit
              hsPkgs.zlib
            ];
          };
        };
      };
    }