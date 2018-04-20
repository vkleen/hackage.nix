{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "numeric-limits";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Lennart Augustsson";
        author = "Lennart Augustsson";
        homepage = "";
        url = "";
        synopsis = "Various floating point limit related constants.";
        description = "Various floating point limit related constants.";
        buildType = "Simple";
      };
      components = {
        numeric-limits = {
          depends  = [ hsPkgs.base ];
        };
      };
    }