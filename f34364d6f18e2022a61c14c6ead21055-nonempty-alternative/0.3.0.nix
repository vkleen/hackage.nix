{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "nonempty-alternative";
          version = "0.3.0";
        };
        license = "BSD-3-Clause";
        copyright = "2016 guaraqe";
        maintainer = "guaraqe@openmailbox.org";
        author = "guaraqe";
        homepage = "http://github.com/guaraqe/nonempty-alternative#readme";
        url = "";
        synopsis = "NonEmpty for Alternative types";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        nonempty-alternative = {
          depends  = [
            hsPkgs.base
            hsPkgs.semigroups
            hsPkgs.comonad
          ];
        };
      };
    }