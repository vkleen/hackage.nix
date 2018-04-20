{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      example = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "ehs";
          version = "0.7.0";
        };
        license = "MIT";
        copyright = "Copyright (C) 2014-2015, Yu Fukuzawa";
        maintainer = "Yu Fukuzawa <minpou.primer@gmail.com>";
        author = "Yu Fukuzawa";
        homepage = "http://github.com/minpou/ehs/";
        url = "";
        synopsis = "Embedded haskell template using quasiquotes.";
        description = "Embedded haskell template using quasiquotes.";
        buildType = "Simple";
      };
      components = {
        ehs = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.haskell-src-meta
            hsPkgs.parsec
            hsPkgs.template-haskell
            hsPkgs.text
            hsPkgs.transformers
          ];
        };
        exes = {
          example = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.ehs
              hsPkgs.text
              hsPkgs.time
            ];
          };
        };
      };
    }