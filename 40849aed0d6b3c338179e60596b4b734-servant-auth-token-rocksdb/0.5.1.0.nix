{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "servant-auth-token-rocksdb";
          version = "0.5.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "2017 Anton Gushcha";
        maintainer = "ncrashed@gmail.com";
        author = "NCrashed";
        homepage = "https://github.com/ncrashed/servant-auth-token#readme";
        url = "";
        synopsis = "RocksDB backend for servant-auth-token server";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        servant-auth-token-rocksdb = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson-injector
            hsPkgs.bytestring
            hsPkgs.concurrent-extra
            hsPkgs.containers
            hsPkgs.exceptions
            hsPkgs.lens
            hsPkgs.monad-control
            hsPkgs.mtl
            hsPkgs.resourcet
            hsPkgs.rocksdb-haskell
            hsPkgs.safe
            hsPkgs.safecopy-store
            hsPkgs.servant-auth-token
            hsPkgs.servant-auth-token-api
            hsPkgs.servant-server
            hsPkgs.store
            hsPkgs.text
            hsPkgs.time
            hsPkgs.transformers
            hsPkgs.transformers-base
            hsPkgs.uuid
            hsPkgs.vector
          ];
        };
      };
    }