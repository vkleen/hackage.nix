{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "srcloc";
          version = "0.1.2";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2006-2012 Harvard University";
        maintainer = "mainland@eecs.harvard.edu";
        author = "Geoffrey Mainland <mainland@eecs.harvard.edu>";
        homepage = "http://www.eecs.harvard.edu/~mainland/";
        url = "";
        synopsis = "Data types for managing source code locations.";
        description = "Data types for managing source code locations.";
        buildType = "Simple";
      };
      components = {
        srcloc = {
          depends  = [
            hsPkgs.base
            hsPkgs.symbol
            hsPkgs.syb
          ];
        };
      };
    }