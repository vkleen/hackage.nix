{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "algebraic";
          version = "0.1.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2014 Wojciech Danilo";
        maintainer = "Wojciech Danilo <wojciech.danilo@gmail.com>";
        author = "Wojciech Danilo";
        homepage = "https://github.com/wdanilo/algebraic";
        url = "";
        synopsis = "General linear algebra structures.";
        description = "";
        buildType = "Simple";
      };
      components = {
        algebraic = {
          depends  = [ hsPkgs.base ];
        };
      };
    }