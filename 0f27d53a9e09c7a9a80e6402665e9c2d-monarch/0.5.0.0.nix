{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "monarch";
          version = "0.5.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Noriyuki OHKAWA <n.ohkawa@gmail.com>";
        author = "Noriyuki OHKAWA <n.ohkawa@gmail.com>";
        homepage = "https://github.com/notogawa/monarch";
        url = "";
        synopsis = "Monadic interface for TokyoTyrant.";
        description = "This package provides simple monadic interface for TokyoTyrant.";
        buildType = "Simple";
      };
      components = {
        monarch = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.bytestring
            hsPkgs.network-conduit
            hsPkgs.binary
            hsPkgs.msgpack
            hsPkgs.transformers
            hsPkgs.network
            hsPkgs.pool-conduit
            hsPkgs.monad-control
            hsPkgs.lifted-base
            hsPkgs.transformers-base
          ];
        };
        tests = {
          specs = {
            depends  = [
              hsPkgs.base
              hsPkgs.mtl
              hsPkgs.bytestring
              hsPkgs.network-conduit
              hsPkgs.binary
              hsPkgs.msgpack
              hsPkgs.network
              hsPkgs.pool-conduit
              hsPkgs.monad-control
              hsPkgs.lifted-base
              hsPkgs.transformers-base
              hsPkgs.hspec
              hsPkgs.HUnit
            ];
          };
          benchmark = {
            depends  = [
              hsPkgs.base
              hsPkgs.mtl
              hsPkgs.bytestring
              hsPkgs.binary
              hsPkgs.network
              hsPkgs.network-conduit
              hsPkgs.pool-conduit
              hsPkgs.monad-control
              hsPkgs.lifted-base
              hsPkgs.tokyotyrant-haskell
              hsPkgs.transformers
              hsPkgs.transformers-base
            ];
          };
        };
      };
    }