{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "classy-parallel";
          version = "0.1.0.0";
        };
        license = "GPL-3.0-only";
        copyright = "";
        maintainer = "amsay@amsay.net";
        author = "Sam Anklesaria";
        homepage = "";
        url = "";
        synopsis = "Fork of the monad-parallel package using monad-control";
        description = "";
        buildType = "Simple";
      };
      components = {
        classy-parallel = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.parallel
            hsPkgs.resourcet
            hsPkgs.lifted-base
            hsPkgs.monad-control
          ];
        };
      };
    }