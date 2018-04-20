{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "GroteTrap";
          version = "0.5.1";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2007-2015 Jeroen Leeuwestein and Martijn van Steenbergen";
        maintainer = "martijn@van.steenbergen.nl";
        author = "Jeroen Leeuwestein, Martijn van Steenbergen";
        homepage = "http://www.haskell.org/haskellwiki/GroteTrap";
        url = "";
        synopsis = "Parser and selection library for expression languages.";
        description = "Allows quick definition of expression languages. You get a parser for free, as well as conversion from text selection to tree selection and back.";
        buildType = "Simple";
      };
      components = {
        GroteTrap = {
          depends  = [
            hsPkgs.base
            hsPkgs.QuickCheck
            hsPkgs.parsec
            hsPkgs.mtl
            hsPkgs.syb
          ];
        };
      };
    }