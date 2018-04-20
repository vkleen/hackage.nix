{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "natural-induction";
          version = "0.2.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "strake888@gmail.com";
        author = "M Farkas-Dyck";
        homepage = "";
        url = "";
        synopsis = "Induction over natural numbers";
        description = "";
        buildType = "Simple";
      };
      components = {
        natural-induction = {
          depends  = [
            hsPkgs.base
            hsPkgs.peano
          ];
        };
      };
    }