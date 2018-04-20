{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      template-haskell-209 = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "th-constraint-compat";
          version = "0.0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2017 Kei Hibino";
        maintainer = "ex8k.hibino@gmail.com";
        author = "Kei Hibino";
        homepage = "";
        url = "";
        synopsis = "Compatibility for type constraint template";
        description = "This package provides compatibe interfaces\nfor type constraint template";
        buildType = "Simple";
      };
      components = {
        th-constraint-compat = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
          ] ++ [
            hsPkgs.template-haskell
          ];
        };
      };
    }