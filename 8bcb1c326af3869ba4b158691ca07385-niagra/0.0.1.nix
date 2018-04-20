{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "niagra";
          version = "0.0.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "nate@symer.io";
        author = "Nathaniel Symer";
        homepage = "";
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
            hsPkgs.mtl
            hsPkgs.text
          ];
        };
        exes = {
          example = {
            depends  = [
              hsPkgs.base
              hsPkgs.niagra
              hsPkgs.text
              hsPkgs.transformers
            ];
          };
          benchmark = {
            depends  = [
              hsPkgs.base
              hsPkgs.niagra
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.criterion
            ];
          };
        };
      };
    }