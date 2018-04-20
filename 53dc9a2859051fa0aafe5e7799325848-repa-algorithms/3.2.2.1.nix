{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "repa-algorithms";
          version = "3.2.2.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Ben Lippmeier <benl@ouroborus.net>";
        author = "The DPH Team";
        homepage = "http://repa.ouroborus.net";
        url = "";
        synopsis = "Algorithms using the Repa array library.";
        description = "Reusable algorithms using the Repa array library.";
        buildType = "Simple";
      };
      components = {
        repa-algorithms = {
          depends  = [
            hsPkgs.base
            hsPkgs.vector
            hsPkgs.repa
          ];
        };
      };
    }