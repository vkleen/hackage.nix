{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "non-empty-sequence";
          version = "0.2.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2016 Omari Norman";
        maintainer = "omari@smileystation.com";
        author = "Omari Norman";
        homepage = "http://www.github.com/massysett/non-empty-sequence";
        url = "";
        synopsis = "Non-empty sequence";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        non-empty-sequence = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.semigroups
          ];
        };
      };
    }