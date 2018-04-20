{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8.0.2";
        identifier = {
          name = "opentheory-stream";
          version = "1.44";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Joe Leslie-Hurd <joe@gilith.com>";
        author = "Joe Leslie-Hurd <joe@gilith.com>";
        homepage = "";
        url = "";
        synopsis = "Infinite stream types";
        description = "Infinite stream types - this package was automatically generated from the\nOpenTheory package stream-1.44";
        buildType = "Simple";
      };
      components = {
        opentheory-stream = {
          depends  = [
            hsPkgs.base
            hsPkgs.QuickCheck
            hsPkgs.opentheory-primitive
            hsPkgs.opentheory
          ];
        };
      };
    }