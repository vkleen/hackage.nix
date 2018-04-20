{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "hasbolt";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright: (c) 2016 Pavel Yakovlev";
        maintainer = "pavel@yakovlev.me";
        author = "Pavel Yakovlev";
        homepage = "https://github.com/zmactep/hasbolt#readme";
        url = "";
        synopsis = "Haskell driver for Neo4j 3+ (BOLT protocol)";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        hasbolt = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.containers
            hsPkgs.binary
            hsPkgs.data-binary-ieee754
            hsPkgs.transformers
            hsPkgs.network
            hsPkgs.network-simple
            hsPkgs.data-default
            hsPkgs.hex
          ];
        };
        tests = {
          hasbolt-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.hasbolt
              hsPkgs.hspec
              hsPkgs.QuickCheck
              hsPkgs.hex
              hsPkgs.text
              hsPkgs.containers
              hsPkgs.bytestring
            ];
          };
        };
      };
    }