{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2.3";
        identifier = {
          name = "pointless-haskell";
          version = "0.0.7";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Hugo Pacheco <hpacheco@di.uminho.pt>";
        author = "Alcino Cunha <alcino@di.uminho.pt>, Hugo Pacheco <hpacheco@di.uminho.pt>";
        homepage = "http://haskell.di.uminho.pt/wiki/Pointless+Haskell";
        url = "";
        synopsis = "Pointless Haskell library";
        description = "Pointless Haskell is library for point-free programming with recursion patterns defined as hylomorphisms, inspired in ideas from the PolyP library.\nGeneric recursion patterns can be expressed for recursive types and no support for mutually recursive types or nested data types is provided.\nThe library also features the visualization of the intermediate data structure of hylomorphisms with GHood (<http://hackage.haskell.org/cgi-bin/hackage-scripts/package/GHood>).";
        buildType = "Simple";
      };
      components = {
        pointless-haskell = {
          depends  = [
            hsPkgs.base
            hsPkgs.GHood
            hsPkgs.haskell98
            hsPkgs.process
            hsPkgs.syb
          ];
        };
      };
    }