{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      base4 = true;
      splitbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "data-fin";
          version = "0.1.1.3";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2012--2014 wren gayle romano";
        maintainer = "wren@community.haskell.org";
        author = "wren gayle romano";
        homepage = "http://code.haskell.org/~wren/";
        url = "";
        synopsis = "Finite totally ordered sets";
        description = "Finite totally ordered sets";
        buildType = "Simple";
      };
      components = {
        data-fin = {
          depends  = [
            hsPkgs.tagged
            hsPkgs.reflection
            hsPkgs.prelude-safeenum
            hsPkgs.smallcheck
            hsPkgs.lazysmallcheck
            hsPkgs.QuickCheck
          ] ++ [ hsPkgs.base ];
        };
      };
    }