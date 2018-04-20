{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "uuagc-bootstrap";
          version = "0.9.38.6.4";
        };
        license = "LicenseRef-GPL";
        copyright = "Universiteit Utrecht";
        maintainer = "Arie Middelkoop <ariem@cs.uu.nl>";
        author = "";
        homepage = "http://www.cs.uu.nl/wiki/HUT/WebHome";
        url = "";
        synopsis = "Attribute Grammar System of Universiteit Utrecht";
        description = "Generates Haskell files from an attribute grammar specification";
        buildType = "Simple";
      };
      components = {
        uuagc-bootstrap = {
          depends  = [
            hsPkgs.base
            hsPkgs.base
          ];
        };
        exes = {
          uuagc-bootstrap = {
            depends  = [
              hsPkgs.base
              hsPkgs.base
              hsPkgs.ghc-prim
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.array
              hsPkgs.haskell98
              hsPkgs.uulib
              hsPkgs.mtl
              hsPkgs.haskell-src-exts
              hsPkgs.filepath
            ];
          };
        };
      };
    }