{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "niagra";
          version = "0.2.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "nate@symer.io";
        author = "Nathaniel Symer";
        homepage = "https://github.com/fhsjaagshs/niagra";
        url = "";
        synopsis = "CSS EDSL for Haskell";
        description = "CSS EDSL for Haskell";
        buildType = "Simple";
      };
      components = {
        niagra = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.containers
            hsPkgs.mtl
            hsPkgs.text
            hsPkgs.ghc-prim
          ];
        };
      };
    }