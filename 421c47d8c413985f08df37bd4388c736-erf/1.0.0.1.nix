{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "erf";
          version = "1.0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Lennart Augustsson";
        author = "Lennart Augustsson";
        homepage = "";
        url = "";
        synopsis = "The error function, erf, and related functions.";
        description = "A type class for the error function, erf, and related functions.\nInstances for Float and Double.";
        buildType = "Simple";
      };
      components = {
        erf = {
          depends  = [ hsPkgs.base ];
        };
      };
    }