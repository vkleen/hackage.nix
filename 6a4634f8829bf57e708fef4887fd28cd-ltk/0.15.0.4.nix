{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "ltk";
          version = "0.15.0.4";
        };
        license = "LicenseRef-GPL";
        copyright = "Juergen \"jutaro\" Nicklisch-Franken";
        maintainer = "maintainer@leksah.org";
        author = "Juergen \"jutaro\" Nicklisch-Franken";
        homepage = "http://www.leksah.org";
        url = "http://code.haskell.org/ltk";
        synopsis = "Leksah tool kit";
        description = "UI Framework used by leksah";
        buildType = "Simple";
      };
      components = {
        ltk = {
          depends  = [
            hsPkgs.Cabal
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.filepath
            hsPkgs.glib
            hsPkgs.text
            hsPkgs.mtl
            hsPkgs.parsec
            hsPkgs.pretty
            hsPkgs.transformers
            hsPkgs.ghc
            hsPkgs.gtk3
          ];
        };
      };
    }